require 'spec_helper'

describe DownloadsController do

  context "get download" do
    it "should be successful" do
      upload = FactoryGirl.create(:upload)
      get :download, :download_id => upload.shortcut
      response.should be_success
    end
    it "should be 404 with an invalid shortcut" do
      lambda do
        get :download, :download_id => "asdfghjk"
        sesponse.should be_error
      end.should raise_error ActionController::RoutingError
    end
  end

end
