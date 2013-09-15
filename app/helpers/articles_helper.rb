module ArticlesHelper
	def link_to_comment(article)
		link_to "comment (#{article.comments_count})" ,article_path(article,:anchor=>"comment")
	end
end
