require 'spec_helper'

describe UploadsController do
  before(:each) do
    @share = Share.create!(:email => "test@example.com")
    @upload_attrs = { :name => "test" }
  end
  context "put :create" do
    context "as a logged out user" do
      it "should redirect to sign in" do
        put :create, :share_id => @share, :upload => @upload_attrs
        response.should redirect_to(new_admin_session_path)
      end
    end

    context "as a logged in user" do
      before(:each) do
        @admin = FactoryGirl.create(:admin)
        sign_in @admin
      end
      it "should create a new upload" do
        lambda do
          put :create, :share_id => @share, :upload => @upload_attrs
        end.should change(Upload, :count).by(1)
      end
      it "should be successful on xhr :put create" do
        xhr :put, :create, :share_id => @share, :upload => @upload_attrs
        response.should be_success 
      end
    end

    context "with an access key" do
      it "should create a new upload" do
        lambda do
          put :create, :share_id => @share, :upload => @upload_attrs,
                                            :access_key => @share.access_key
        end.should change(Upload, :count).by(1)
      end
      it "should be successful on xhr :put create" do
        xhr :put, :create, :share_id => @share, :upload => @upload_attrs,
                           :access_key => @share.access_key
        response.should be_success 
      end
    end
  end

  context "delete :destroy" do
    before(:each) do
      @upload = @share.uploads.build(:name => "test")
      @upload.save
    end
    context "as a logged out user" do
      it "should redirect to sign in" do
        delete :destroy, :share_id => @share, :id => @upload
        response.should redirect_to(new_admin_session_path)
      end
    end

    context "as a logged in user" do
      before(:each) do
        @admin = FactoryGirl.create(:admin)
        sign_in @admin
      end
      it "should reduce the number of uploads by 1" do
        lambda do
          delete :destroy, :share_id => @share, :id => @upload
        end.should change(Upload, :count).by(-1)
      end
      it "should be successful on an xhr delete :destroy" do
        xhr :delete, :destroy, :share_id => @share, :id => @upload
        response.should be_success 
      end
    end

    context "with an access key" do
      it "should reduce the number of uploads by 1" do
        lambda do
          delete :destroy, :share_id => @share, :id => @upload, 
                                                :access_key => @share.access_key
        end.should change(Upload, :count).by(-1)
      end
      it "should be successful on an xhr delete :destroy" do
        xhr :delete, :destroy, :share_id => @share, :id => @upload, 
                               :access_key => @share.access_key
        response.should be_success 
      end
    end
  end
end
