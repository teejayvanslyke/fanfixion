require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/statuses/edit.html.erb" do
  include StatusesHelper
  
  before(:each) do
    assigns[:status] = @status = stub_model(Status,
      :new_record? => false,
      :twitter_id => 1,
      :text => "value for text",
      :favorited => false,
      :truncated => false,
      :twitter_user_id => 1
    )
  end

  it "renders the edit status form" do
    render
    
    response.should have_tag("form[action=#{status_path(@status)}][method=post]") do
      with_tag('input#status_twitter_id[name=?]', "status[twitter_id]")
      with_tag('input#status_text[name=?]', "status[text]")
      with_tag('input#status_favorited[name=?]', "status[favorited]")
      with_tag('input#status_truncated[name=?]', "status[truncated]")
      with_tag('input#status_twitter_user_id[name=?]', "status[twitter_user_id]")
    end
  end
end


