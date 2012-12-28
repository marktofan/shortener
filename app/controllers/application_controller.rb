class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)

    if resource.role? :admin
      admin_links_path
    else
      links_path
    end

  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to user_session_url, :alert => exception.message
  end


  rescue_from ActiveRecord::RecordNotFound do |x|
    render :file => 'public/404', :layout => true, :status => '404'
  end

end
