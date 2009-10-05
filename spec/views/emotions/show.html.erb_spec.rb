require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/emotions/show.html.erb" do
  include EmotionsHelper
  before(:each) do
    assigns[:emotion] = @emotion = stub_model(Emotion,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end

