require 'spec_helper'

describe SharesController do
  render_views

  context "show" do
    before(:each) do
      @share = Share.create!(:email => "test@example.com", 
                             :title => "Test share", 
                             :description => "Test description test")
    end

    it "should be successful" do
      get :show, :id => @share
      response.should be_success
    end

    it "should contain the share data in the page content" do
      get :show, :id => @share
      #check the description exists in the page
      response.should have_selector("div", :content => @share.description)
      #check the title exists in a h1
      response.should have_selector("h1",  :content => @share.title)
    end

    it "should show the to email where there is no title" do
      get :show, :id => Share.create(:email => "test@example.com")
      response.should have_selector("h1", 
                                    :content => "Share for test@example.com")
    end

  end
end
