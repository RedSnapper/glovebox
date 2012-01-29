require 'spec_helper'

describe Share do
  context "validation" do
    it "should be valid with required attributes" do
      share = Share.new(:email => "test@example.com")
      share.should be_valid
    end
    it "should be invalid without an email address" do
      share = Share.new(:email => "")
      share.should_not be_valid
    end
    it "should check email validity" do
      share = Share.new(:email => "test@example")
      share.should_not be_valid
    end
  end
  context "association" do
    before(:each) do
      @share = Share.create!(:email => "test@example.com")
    end
    it "should have uploads" do
      @share.should respond_to(:uploads)
    end
  end
  context "access key" do
    it "should generate an access key on create" do
      share = Share.create!(:email => "test@example.com")
      share.access_key.length.should == 24
    end
    it "should verify the access key is correct" do
      share = Share.create!(:email => "test@example.com")
      share.check_access_key(share.access_key).should be_true
    end
    it "shold verify the access key is wrong" do
      share = Share.create!(:email => "test@example.com")
      share.check_access_key("wrong_key").should be_false
    end
  end
end
