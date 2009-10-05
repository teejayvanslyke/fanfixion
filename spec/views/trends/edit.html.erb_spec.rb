require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/trends/edit.html.erb" do
  include TrendsHelper
  
  before(:each) do
    assigns[:trend] = @trend = stub_model(Trend,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit trend form" do
    render
    
    response.should have_tag("form[action=#{trend_path(@trend)}][method=post]") do
      with_tag('input#trend_name[name=?]', "trend[name]")
    end
  end
end


