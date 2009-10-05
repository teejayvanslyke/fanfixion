require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/emotions/edit.html.erb" do
  include EmotionsHelper
  
  before(:each) do
    assigns[:emotion] = @emotion = stub_model(Emotion,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit emotion form" do
    render
    
    response.should have_tag("form[action=#{emotion_path(@emotion)}][method=post]") do
      with_tag('input#emotion_name[name=?]', "emotion[name]")
    end
  end
end


