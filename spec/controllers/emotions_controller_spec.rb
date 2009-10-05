require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EmotionsController do

  def mock_emotion(stubs={})
    @mock_emotion ||= mock_model(Emotion, stubs)
  end
  
  describe "GET index" do
    it "assigns all emotions as @emotions" do
      Emotion.stub!(:find).with(:all).and_return([mock_emotion])
      get :index
      assigns[:emotions].should == [mock_emotion]
    end
  end

  describe "GET show" do
    it "assigns the requested emotion as @emotion" do
      Emotion.stub!(:find).with("37").and_return(mock_emotion)
      get :show, :id => "37"
      assigns[:emotion].should equal(mock_emotion)
    end
  end

  describe "GET new" do
    it "assigns a new emotion as @emotion" do
      Emotion.stub!(:new).and_return(mock_emotion)
      get :new
      assigns[:emotion].should equal(mock_emotion)
    end
  end

  describe "GET edit" do
    it "assigns the requested emotion as @emotion" do
      Emotion.stub!(:find).with("37").and_return(mock_emotion)
      get :edit, :id => "37"
      assigns[:emotion].should equal(mock_emotion)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created emotion as @emotion" do
        Emotion.stub!(:new).with({'these' => 'params'}).and_return(mock_emotion(:save => true))
        post :create, :emotion => {:these => 'params'}
        assigns[:emotion].should equal(mock_emotion)
      end

      it "redirects to the created emotion" do
        Emotion.stub!(:new).and_return(mock_emotion(:save => true))
        post :create, :emotion => {}
        response.should redirect_to(emotion_url(mock_emotion))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved emotion as @emotion" do
        Emotion.stub!(:new).with({'these' => 'params'}).and_return(mock_emotion(:save => false))
        post :create, :emotion => {:these => 'params'}
        assigns[:emotion].should equal(mock_emotion)
      end

      it "re-renders the 'new' template" do
        Emotion.stub!(:new).and_return(mock_emotion(:save => false))
        post :create, :emotion => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested emotion" do
        Emotion.should_receive(:find).with("37").and_return(mock_emotion)
        mock_emotion.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :emotion => {:these => 'params'}
      end

      it "assigns the requested emotion as @emotion" do
        Emotion.stub!(:find).and_return(mock_emotion(:update_attributes => true))
        put :update, :id => "1"
        assigns[:emotion].should equal(mock_emotion)
      end

      it "redirects to the emotion" do
        Emotion.stub!(:find).and_return(mock_emotion(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(emotion_url(mock_emotion))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested emotion" do
        Emotion.should_receive(:find).with("37").and_return(mock_emotion)
        mock_emotion.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :emotion => {:these => 'params'}
      end

      it "assigns the emotion as @emotion" do
        Emotion.stub!(:find).and_return(mock_emotion(:update_attributes => false))
        put :update, :id => "1"
        assigns[:emotion].should equal(mock_emotion)
      end

      it "re-renders the 'edit' template" do
        Emotion.stub!(:find).and_return(mock_emotion(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested emotion" do
      Emotion.should_receive(:find).with("37").and_return(mock_emotion)
      mock_emotion.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the emotions list" do
      Emotion.stub!(:find).and_return(mock_emotion(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(emotions_url)
    end
  end

end
