require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Status do
  before(:each) do
    @valid_attributes = {
      :twitter_id => 1,
      :text => "value for text",
      :favorited => false,
      :truncated => false,
      :twitter_user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Status.create!(@valid_attributes)
  end
end
