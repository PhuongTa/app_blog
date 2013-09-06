class ArticlesController < ApplicationController
 
  #before_filter :authenticate_user!, :except =>[:index,:show]
  #load_and_authorize_resource
  def new
  	@article= Article.new
  end
  def create  	
  	@article = Article.create(params[:article])
  	if @article.save
  		flash[:notice]="Successfully created article."
  		redirect_to @article
  	else
  		render 'new'
  	end
  end
  def edit
  end
  def update  	
  end
  def show
  	@article = Article.find(params[:id])
  end
  def index
  	@articles = Article.all
  end
  def destroy
  end
end
