require 'spec_helper'

describe UploadsController do
  before(:each) do
    @share = Share.create!(:email => "test@example.com")
    @upload_attrs = { :name => "test" }
  end
  context "put :create" do
    it "should create a new upload" do
      lambda do
        put :create, :share_id => @share, :upload => @upload_attrs
      end.should change(Upload, :count).by(1)
    end
    it "should redirect to the share on success" do
      put :create, :share_id => @share, :upload => @upload_attrs
      response.should redirect_to @share
    end
  end

  context "delete :destroy" do
    before(:each) do
      @upload = @share.uploads.build(:name => "test")
      @upload.save
    end
    it "should reduce the number of uploads by 1" do
      lambda do
        delete :destroy, :share_id => @share, :id => @upload
      end.should change(Upload, :count).by(-1)
    end
    it "should redirect to the share on success" do
      delete :destroy, :share_id => @share, :id => @upload
      response.should redirect_to @share
    end
  end
end
