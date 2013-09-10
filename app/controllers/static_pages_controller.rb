class StaticPagesController < ApplicationController
  def index
  	#@articles = Article.find(:all,:conditions=>["published =? ", true])
  	@articles = Article.recent
  end
end
