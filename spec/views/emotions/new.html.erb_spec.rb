require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/emotions/new.html.erb" do
  include EmotionsHelper
  
  before(:each) do
    assigns[:emotion] = stub_model(Emotion,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new emotion form" do
    render
    
    response.should have_tag("form[action=?][method=post]", emotions_path) do
      with_tag("input#emotion_name[name=?]", "emotion[name]")
    end
  end
end


