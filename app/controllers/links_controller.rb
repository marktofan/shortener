class LinksController < ApplicationController
  # GET /links
  # GET /links.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    begin
      @link = Link.find(params[:id])

      redirect_to @link.url

        #respond_to do |format|
        #  format.html # show.html.erb
        #  format.json { render json: @link }
        #end

        # if no row - print 404, not found
    rescue ActiveRecord::RecordNotFound => e

      render :text => 'Not Found', :status => '404'
    end

  end


  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])

    @link.url=params['url']


    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "index" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

end
