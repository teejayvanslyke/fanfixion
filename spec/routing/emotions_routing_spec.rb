require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EmotionsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "emotions", :action => "index").should == "/emotions"
    end
  
    it "maps #new" do
      route_for(:controller => "emotions", :action => "new").should == "/emotions/new"
    end
  
    it "maps #show" do
      route_for(:controller => "emotions", :action => "show", :id => "1").should == "/emotions/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "emotions", :action => "edit", :id => "1").should == "/emotions/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "emotions", :action => "create").should == {:path => "/emotions", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "emotions", :action => "update", :id => "1").should == {:path =>"/emotions/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "emotions", :action => "destroy", :id => "1").should == {:path =>"/emotions/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/emotions").should == {:controller => "emotions", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/emotions/new").should == {:controller => "emotions", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/emotions").should == {:controller => "emotions", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/emotions/1").should == {:controller => "emotions", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/emotions/1/edit").should == {:controller => "emotions", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/emotions/1").should == {:controller => "emotions", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/emotions/1").should == {:controller => "emotions", :action => "destroy", :id => "1"}
    end
  end
end
