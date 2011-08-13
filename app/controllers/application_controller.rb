class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :redirect_url

  private
  def redirect_url
    case session[:came_from]
      when :index then lists_url
      when :show then list_url(params[:list_id])
      else lists_url
    end
  end
end
