module BlogHelper
  def blog_article_page?
    !current_page.directory_index?
  end

  def blog_page_css_class_name
    blog_article_page? ? 'p-blog-article' : 'p-blog-index'
  end
end
