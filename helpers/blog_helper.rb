module BlogHelper
  def blog_article_page?
    !current_page.directory_index?
  end
end
