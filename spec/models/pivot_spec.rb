require 'spec_helper'

describe Pivot do
  before(:each) do
    @valid_attributes = {
      :emotion_id => 1,
      :trend_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Pivot.create!(@valid_attributes)
  end
end
