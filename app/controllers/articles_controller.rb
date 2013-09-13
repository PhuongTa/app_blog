class ArticlesController < ApplicationController
 
  before_filter :authenticate_user!, :except =>:show
  #load_resource
  #load_and_authorize_resource :only => [:index, :show]
  #skip_authorize_resource, :only => [:index,:show]
  def index
    #@articles = Article.accessible_by(current_ability,:index)
    #@articles = Article.all
    #@articles =Article.recent.find(:all, :include => :comments)
    @articles =Article.find(:all, :include => :comments)
  end
  def new
  	@article= Article.new
  end
  def create  	
  	@article = Article.create(params[:article])
    @article.user_id = current_user.id
  	if @article.save
  		flash[:notice]="Successfully created article."
  		redirect_to @article
  	else
  		render 'new'
  	end
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice]="Updated article"
      redirect_to @article
    else
      flash[:error]="There are some errors"
      render 'edit'
    end
  end
  def show
  	@article = Article.find(params[:id])
    @comment = Comment.new(:article => @article)
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] ="Delete article successfully."
    redirect_to articles_path
  end

  # def published
  #   @article = Article.find(params[:id])
  #   @article.published = true
  #   @article.published_at = Time.now
  #   if @article && @article.update_attributes(params[:article])
  #     redirect_to articles_path
  #   else
  #       flash[:error] ="Can not updated."
  #       redirect_to articles_path
  #   end
  # end
  def change_published
    article = Article.find(params[:id])
    if article.published?
        article.toggle!(:published)
        article.lastest_edit = Time.now
    else
        article.toggle!(:published)
        article.published_at = Time.now  
    end
    
    if article && article.update_attributes(params[:article])
      redirect_to articles_path
    else
        flash[:error] ="Can not updated."
        redirect_to articles_path
    end
  end

  def current_article
   @current_article ||= Article.find_by_id(params[:id])
  end

helper_method :current_article
end
