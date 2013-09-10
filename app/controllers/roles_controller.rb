class RolesController < ApplicationController
 #before_filter :authenticate_user!
 #load_and_authorize_resource
 before_filter :check_permissions, :only=> [:new,:create]

  def new
  	@role = Role.new
  end
  def create
    #authorize! :create_role, @user if params[:user][:create_role]
  	@role = Role.create(params[:role])
  	if @role.save
		flash[:notice]="Create new role successfully."
		redirect_to root_url
	else
		render 'new'
  	end
  end

  def check_permissions
    authorize! :create, Role
  end
end
