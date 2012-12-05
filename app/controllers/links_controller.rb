class LinksController < ApplicationController
  # GET /links
  # GET /links.json

  respond_to :html, :json

  def index

    @link = Link.new

    respond_with(@links)
  end

  # GET /links/1
  # GET /links/1.json
  def show
    begin
      @link = Link.find(params[:id])

      redirect_to @link.url

        # if no row - print 404 template
    rescue ActiveRecord::RecordNotFound => e

      render :file => 'public/404', :layout => true, :status => '404'
    end

  end


  # POST /links
  # POST /links.json
  def create

    # check first if url exist in database
    row= Link.find_by_url(params[:url])

    if row == nil
      @link = Link.new(url: params[:url])
      @link.save

    elsif @link=row
    end

    respond_with(@link) do |format|
      format.html { render action: "index" }
    end
  end
end
