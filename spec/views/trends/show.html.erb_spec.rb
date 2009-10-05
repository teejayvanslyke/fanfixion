require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/trends/show.html.erb" do
  include TrendsHelper
  before(:each) do
    assigns[:trend] = @trend = stub_model(Trend,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end

