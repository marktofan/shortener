class LinksController < ApplicationController
  load_and_authorize_resource

  expose(:link) {
    @link
  }
  expose(:ransack) {
    @links.search(params[:q])
  }
  expose(:links) {
    @per_page = params[:per_page] || 10
    ransack.result.paginate(:page => params[:page], :per_page => @per_page.to_i)
  }

  respond_to :html, :json

# redirect to long url
  def show
    redirect_to link.url
  end

# POST /links
# POST /links.json
  def create

    if user_signed_in?

      # check first if url exist in database
      row= Link.find_by_url_and_user_id(params[:link][:url], current_user.id)

      if row == nil

        link.user_id = current_user.id
        link.save
      elsif link=row
      end

    else
      @link.save
    end

    respond_with(link) do |format|
      format.html { render action: "new" }
    end
  end

end
