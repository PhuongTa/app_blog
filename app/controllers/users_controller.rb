class UsersController < ApplicationController
	before_filter :get_user, :only =>[:index,:new,:edit]
	before_filter :accessible_roles, :only => [:new,:edit,:show,:update,:create]
	load_and_authorize_resource :only=>[:show,:new,:destroy,:edit,:update]
	
	def index
		@users= User.accessible_by(current_ability,:index).limit(20)
		respond_to do |format|
	      format.json { render :json => @users }
	      format.xml  { render :xml => @users }
	      format.html
    	end
	end

	def new
		
	end
	def create
		@user= User.new(params[:user])
		if @user.save
			flash[:success]="Account has been created."
			redirect_to @user
		else
			flash[:error]="Could not create user."
			render :action=> 'new'
		end
	end
	def show
	    respond_to do |format|
	      format.json { render :json => @user }
	      format.xml  { render :xml => @user }
	      format.html      
	    end
 
	  rescue ActiveRecord::RecordNotFound
	    respond_to_not_found(:json, :xml, :html)
	end

	def edit
	end
	
	def update
		if params[:user][:password].blank?
			[:password,:password_confirmation,:current_password].collect{|p| params[:user].delete(p)}
		else
			@user.errors[:base] << "The password you enter is incorrect" unless	@user.valid_password?(params[:user][:current_password])
		end
		if @user.errors[:base].empty? && @user.update_attributes(params[:user])
			flash[:notice]= "Your account has been updated."
			redirect_to @user
		else
			flash[:error]="Could not update user."
			render :action=> 'edit'
		end
	end
	def destroy
		#@user.destroy!
		@user.destroy
		flash[:notice]="Delete account successfully."
		redirect_to users_url
	end

	private
	#Get roles accessible by the current_user
		def accessible_roles
			@accessible_roles = Role.accessible_by(current_ability, :read)
		end
	#Make the current_user object available to views
		def get_user
			@current_user = current_user
		end


end
