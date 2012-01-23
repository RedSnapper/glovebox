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

  context "get :new" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  context "put :create" do
    before(:each) do
      @good_attrs = { :email => "test@example.com", :title => "Test",
                                                    :description => "This is a test" }
      @bad_attrs = { :email => "", :title => "Bad", :description => "Bad example" }
    end
    it "should redirect with good parameters" do
      put :create, :share => @good_attrs
      response.should redirect_to Share.last
    end

    it "should render :new with bad parameters" do
      put :create, :share => @bad_attrs
      response.should render_template :new
    end

    it "should create a new share with good parameters" do
      lambda do
        put :create, :share => @good_attrs
      end.should change(Share, :count).by(1)
    end

    it "should not create a new share with bad parameters" do
      lambda do
        put :create, :share => @bad_attrs
      end.should_not change(Share, :count)
    end

    it "should have a success flash with good parameters" do
      put :create, :share => @good_attrs
      flash[:success].should =~ /Share created/i
    end

    it "should have an error flash with bad parameters" do
      put :create, :share => @bad_attrs
      flash[:error].should =~ /Share creation failed/i
    end

  end

  context "get :edit" do
    before(:each) do
      @share = Share.create!(:email => "test@example.com")
    end

    it "should be successful" do
      get :edit, :id => @share
    end
  end

  context "put :update" do
    before(:each) do
      @share = Share.create!(:email => "test@example.com")
      @good_attrs = { :email => "test@example.com", :title => "Test",
                                                    :description => "This is a test" }
      @bad_attrs = { :email => "", :title => "Bad", :description => "Bad example" }
    end
    it "should redirect with good parameters" do
      put :update, :id => @share, :share => @good_attrs
      response.should redirect_to Share.last
    end
    it "should render :new with bad parameters" do
      put :update, :id => @share, :share => @bad_attrs
      response.should render_template :edit
    end
    it "should have a success flash with good parameters" do
      put :update, :id => @share, :share => @good_attrs
      flash[:success].should =~ /Share updated/i
    end
    it "should have an error flash with bad parameters" do
      put :update, :id => @share, :share => @bad_attrs
      flash[:error].should =~ /Share update failed/i
    end
  end

  context "destroy :delete" do
    before(:each) do
      @share = Share.create!(:email => "test@example.com")
    end
    it "should delete the share" do
      lambda do
        delete :destroy, :id => @share
      end.should change(Share, :count).by(-1)
    end
    it "should redirect to :index" do
      delete :destroy, :id => @share
      response.should redirect_to shares_path
    end
    it "should have a success flash on deletion" do
      delete :destroy, :id => @share
      flash[:success].should =~ /Share deleted/i
    end
  end

end
