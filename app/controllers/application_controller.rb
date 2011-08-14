class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :redirect_url, :is_logged_in?

  private
  def redirect_url
    case session[:came_from]
      when :index then lists_url
      when :show then list_url(params[:list_id])
      else lists_url
    end
  end

  def is_logged_in?
    logger.error "ERROR: user was not logged in."
    redirect_to root_url, :notice => "Oops.  You need to be logged in to go there." unless session.has_key? :id
  end
end
