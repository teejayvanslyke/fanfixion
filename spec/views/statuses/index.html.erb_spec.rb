require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/statuses/index.html.erb" do
  include StatusesHelper
  
  before(:each) do
    assigns[:statuses] = [
      stub_model(Status,
        :twitter_id => 1,
        :text => "value for text",
        :favorited => false,
        :truncated => false,
        :twitter_user_id => 1
      ),
      stub_model(Status,
        :twitter_id => 1,
        :text => "value for text",
        :favorited => false,
        :truncated => false,
        :twitter_user_id => 1
      )
    ]
  end

  it "renders a list of statuses" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for text".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

