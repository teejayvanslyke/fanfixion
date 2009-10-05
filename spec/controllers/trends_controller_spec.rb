require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TrendsController do

  def mock_trend(stubs={})
    @mock_trend ||= mock_model(Trend, stubs)
  end
  
  describe "GET index" do
    it "assigns all trends as @trends" do
      Trend.stub!(:find).with(:all).and_return([mock_trend])
      get :index
      assigns[:trends].should == [mock_trend]
    end
  end

  describe "GET show" do
    it "assigns the requested trend as @trend" do
      Trend.stub!(:find).with("37").and_return(mock_trend)
      get :show, :id => "37"
      assigns[:trend].should equal(mock_trend)
    end
  end

  describe "GET new" do
    it "assigns a new trend as @trend" do
      Trend.stub!(:new).and_return(mock_trend)
      get :new
      assigns[:trend].should equal(mock_trend)
    end
  end

  describe "GET edit" do
    it "assigns the requested trend as @trend" do
      Trend.stub!(:find).with("37").and_return(mock_trend)
      get :edit, :id => "37"
      assigns[:trend].should equal(mock_trend)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created trend as @trend" do
        Trend.stub!(:new).with({'these' => 'params'}).and_return(mock_trend(:save => true))
        post :create, :trend => {:these => 'params'}
        assigns[:trend].should equal(mock_trend)
      end

      it "redirects to the created trend" do
        Trend.stub!(:new).and_return(mock_trend(:save => true))
        post :create, :trend => {}
        response.should redirect_to(trend_url(mock_trend))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved trend as @trend" do
        Trend.stub!(:new).with({'these' => 'params'}).and_return(mock_trend(:save => false))
        post :create, :trend => {:these => 'params'}
        assigns[:trend].should equal(mock_trend)
      end

      it "re-renders the 'new' template" do
        Trend.stub!(:new).and_return(mock_trend(:save => false))
        post :create, :trend => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested trend" do
        Trend.should_receive(:find).with("37").and_return(mock_trend)
        mock_trend.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :trend => {:these => 'params'}
      end

      it "assigns the requested trend as @trend" do
        Trend.stub!(:find).and_return(mock_trend(:update_attributes => true))
        put :update, :id => "1"
        assigns[:trend].should equal(mock_trend)
      end

      it "redirects to the trend" do
        Trend.stub!(:find).and_return(mock_trend(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(trend_url(mock_trend))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested trend" do
        Trend.should_receive(:find).with("37").and_return(mock_trend)
        mock_trend.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :trend => {:these => 'params'}
      end

      it "assigns the trend as @trend" do
        Trend.stub!(:find).and_return(mock_trend(:update_attributes => false))
        put :update, :id => "1"
        assigns[:trend].should equal(mock_trend)
      end

      it "re-renders the 'edit' template" do
        Trend.stub!(:find).and_return(mock_trend(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested trend" do
      Trend.should_receive(:find).with("37").and_return(mock_trend)
      mock_trend.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the trends list" do
      Trend.stub!(:find).and_return(mock_trend(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(trends_url)
    end
  end

end
