require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/trends/new.html.erb" do
  include TrendsHelper
  
  before(:each) do
    assigns[:trend] = stub_model(Trend,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new trend form" do
    render
    
    response.should have_tag("form[action=?][method=post]", trends_path) do
      with_tag("input#trend_name[name=?]", "trend[name]")
    end
  end
end


