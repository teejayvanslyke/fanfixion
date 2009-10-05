class EmotionsController < ApplicationController
  # GET /emotions
  # GET /emotions.xml
  def index
    @emotions = Emotion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emotions }
    end
  end

  # GET /emotions/1
  # GET /emotions/1.xml
  def show
    @emotion = Emotion.find_by_name(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @emotion }
    end
  end

  # GET /emotions/new
  # GET /emotions/new.xml
  def new
    @emotion = Emotion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @emotion }
    end
  end

  # GET /emotions/1/edit
  def edit
    @emotion = Emotion.find_by_name(params[:id])
  end

  # POST /emotions
  # POST /emotions.xml
  def create
    @emotion = Emotion.new(params[:emotion])

    respond_to do |format|
      if @emotion.save
        flash[:notice] = 'Emotion was successfully created.'
        format.html { redirect_to(@emotion) }
        format.xml  { render :xml => @emotion, :status => :created, :location => @emotion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @emotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emotions/1
  # PUT /emotions/1.xml
  def update
    @emotion = Emotion.find_by_name(params[:id])

    respond_to do |format|
      if @emotion.update_attributes(params[:emotion])
        flash[:notice] = 'Emotion was successfully updated.'
        format.html { redirect_to(@emotion) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @emotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emotions/1
  # DELETE /emotions/1.xml
  def destroy
    @emotion = Emotion.find_by_name(params[:id])
    @emotion.destroy

    respond_to do |format|
      format.html { redirect_to(emotions_url) }
      format.xml  { head :ok }
    end
  end
end
