require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ScoreAudit do
  before(:each) do
    @valid_attributes = {
      :emotion_id => 1,
      :trend_id => 1,
      :type => "value for type",
      :score => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    ScoreAudit.create!(@valid_attributes)
  end
end
