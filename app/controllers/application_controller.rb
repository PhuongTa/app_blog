class ApplicationController < ActionController::Base
  protect_from_forgery

  # rescure_from CanCan::AccessDenied do|exception|
  # 	flash[:error] = exception.message
  # 	redirect_to root_url
  # end

  rescue_from CanCan::AccessDenied do |exception|
	  # flash[:error] = "Access denied."
	  flash[:error] = exception.message
	  redirect_to root_url
  end
end
