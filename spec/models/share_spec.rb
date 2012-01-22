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
end
