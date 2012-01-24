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
end
