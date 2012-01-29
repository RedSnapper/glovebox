require 'spec_helper'

describe Admin do
  it "should  be valid given valid attributes" do
    admin_attrs = Factory.attributes_for(:admin)
    a = Admin.new(admin_attrs)
    a.should be_valid
  end
end
