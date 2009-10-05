require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sentiment do
  before(:each) do
    @valid_attributes = {
      :status_id => 1,
      :emotion_id => 1,
      :trained => false
    }
  end

  it "should create a new instance given valid attributes" do
    Sentiment.create!(@valid_attributes)
  end
end
