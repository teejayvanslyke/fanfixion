require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StaticController do

  #Delete these examples and add some real ones
  it "should use StaticController" do
    controller.should be_an_instance_of(StaticController)
  end


  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end
end
