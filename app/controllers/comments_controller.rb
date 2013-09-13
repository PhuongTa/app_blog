class CommentsController < ApplicationController
	load_resource
	def new
		@comment = Comment.new
	end

	def create
		@article = Article.find_by_id(@comment.article_id)
		@comment = @article.comments.build(params[:comment])
		if @comment.save
			flash[:notice]="Create comment successfully."
			redirect_to article_url(@comment.article_id)
		else
			render :action =>'new'
		end
	end

	def edit		
	end
	def update		
	end
	def destroy		
	end
end
