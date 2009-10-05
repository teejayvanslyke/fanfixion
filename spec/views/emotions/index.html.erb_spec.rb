require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/emotions/index.html.erb" do
  include EmotionsHelper
  
  before(:each) do
    assigns[:emotions] = [
      stub_model(Emotion,
        :name => "value for name"
      ),
      stub_model(Emotion,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of emotions" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

