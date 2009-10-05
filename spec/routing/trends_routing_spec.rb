require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TrendsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "trends", :action => "index").should == "/trends"
    end
  
    it "maps #new" do
      route_for(:controller => "trends", :action => "new").should == "/trends/new"
    end
  
    it "maps #show" do
      route_for(:controller => "trends", :action => "show", :id => "1").should == "/trends/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "trends", :action => "edit", :id => "1").should == "/trends/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "trends", :action => "create").should == {:path => "/trends", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "trends", :action => "update", :id => "1").should == {:path =>"/trends/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "trends", :action => "destroy", :id => "1").should == {:path =>"/trends/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/trends").should == {:controller => "trends", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/trends/new").should == {:controller => "trends", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/trends").should == {:controller => "trends", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/trends/1").should == {:controller => "trends", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/trends/1/edit").should == {:controller => "trends", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/trends/1").should == {:controller => "trends", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/trends/1").should == {:controller => "trends", :action => "destroy", :id => "1"}
    end
  end
end
