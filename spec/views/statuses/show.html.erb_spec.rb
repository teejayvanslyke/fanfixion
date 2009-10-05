require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/statuses/show.html.erb" do
  include StatusesHelper
  before(:each) do
    assigns[:status] = @status = stub_model(Status,
      :twitter_id => 1,
      :text => "value for text",
      :favorited => false,
      :truncated => false,
      :twitter_user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ text/)
    response.should have_text(/false/)
    response.should have_text(/false/)
    response.should have_text(/1/)
  end
end

