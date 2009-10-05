require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/trends/index.html.erb" do
  include TrendsHelper
  
  before(:each) do
    assigns[:trends] = [
      stub_model(Trend,
        :name => "value for name"
      ),
      stub_model(Trend,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of trends" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

