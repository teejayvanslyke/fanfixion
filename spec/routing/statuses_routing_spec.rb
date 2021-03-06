require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatusesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "statuses", :action => "index").should == "/statuses"
    end
  
    it "maps #new" do
      route_for(:controller => "statuses", :action => "new").should == "/statuses/new"
    end
  
    it "maps #show" do
      route_for(:controller => "statuses", :action => "show", :id => "1").should == "/statuses/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "statuses", :action => "edit", :id => "1").should == "/statuses/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "statuses", :action => "create").should == {:path => "/statuses", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "statuses", :action => "update", :id => "1").should == {:path =>"/statuses/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "statuses", :action => "destroy", :id => "1").should == {:path =>"/statuses/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/statuses").should == {:controller => "statuses", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/statuses/new").should == {:controller => "statuses", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/statuses").should == {:controller => "statuses", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/statuses/1").should == {:controller => "statuses", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/statuses/1/edit").should == {:controller => "statuses", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/statuses/1").should == {:controller => "statuses", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/statuses/1").should == {:controller => "statuses", :action => "destroy", :id => "1"}
    end
  end
end
