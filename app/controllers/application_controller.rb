class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
  	if (session[:user_id])
  		@current_user ||= User.where(id: session[:user_id])[0]
  	end
  end

  def authorize
  	redirect_to '/login' unless current_user
  end
end
