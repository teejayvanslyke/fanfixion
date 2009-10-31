class TrendsController < ApplicationController
  # GET /trends
  # GET /trends.xml
  def index
    @trends = Trend.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trends }
    end
  end

  # GET /trends/1
  # GET /trends/1.xml
  def show
    @trend = Trend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trend }
    end
  end

  # GET /trends/new
  # GET /trends/new.xml
  def new
    @trend = Trend.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trend }
    end
  end

  # GET /trends/1/edit
  def edit
    @trend = Trend.find(params[:id])
  end

  # POST /trends
  # POST /trends.xml
  def create
    @trend = Trend.find_by_name(params[:trend][:name]) || Trend.new(params[:trend])

    respond_to do |format|
      if @trend.save
        flash[:notice] = "No one's asked me about <em>#{@trend.name}</em> before, so give me awhile to <em>feel it out</em>."
        format.html { redirect_to(@trend) }
        format.xml  { render :xml => @trend, :status => :created, :location => @trend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trends/1
  # PUT /trends/1.xml
  def update
    @trend = Trend.find(params[:id])

    respond_to do |format|
      if @trend.update_attributes(params[:trend])
        flash[:notice] = 'Trend was successfully updated.'
        format.html { redirect_to(@trend) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trends/1
  # DELETE /trends/1.xml
  def destroy
    @trend = Trend.find(params[:id])
    @trend.destroy

    respond_to do |format|
      format.html { redirect_to(trends_url) }
      format.xml  { head :ok }
    end
  end
end
