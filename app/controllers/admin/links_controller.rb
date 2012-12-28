class Admin::LinksController < ApplicationController
  load_and_authorize_resource

  expose(:link) {
    @link
  }
  expose(:ransack) {
    @links.search(params[:q])
  }
  expose(:per_page) { params[:per_page] || 10 }
  expose(:links) {
    ransack.result.paginate(:page => params[:page], :per_page => per_page.to_i)
  }

  respond_to :html, :json, :xml


  # DELETE /links/1
  # DELETE /links/1.json
  def destroy

    link.delete

    respond_with(link) do |format|
      format.html { redirect_to request.referer ? request.referer : admin_links_url }
      format.json { head :no_content }
    end
  end
end
