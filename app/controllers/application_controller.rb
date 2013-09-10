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


  # Refer to return the 403 Forbidden HTTP code 
  # create a public/403.html file and write a 
  # rescue_from statement like this example in ApplicationController:
  # render :file => "#{Rails.root}/public/403.html", :status => 403, :layout =>false
  end
end
