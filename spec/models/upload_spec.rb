require 'spec_helper'

describe Upload do
  before(:each) do
    @share = Share.new(:email => "test@example.com")
    @upload = @share.uploads.build(:name => "test")
  end
  context "associations" do
    it "should have a Share" do
      @upload.should respond_to(:share).with(@share.id)
    end
  end
  context "shortcut generation" do
    it "should generate a shortcut when saved" do
      @upload.save
      @upload.shortcut.length.should == 8
    end
  end
end
