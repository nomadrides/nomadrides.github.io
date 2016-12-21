module BlogHelper
  def blog_article_page?
    !current_page.directory_index?
  end

  def blog_article_summary_tag(article)
    if article.data['summary']
      content_tag :p, article.data['summary']
    else
      article.summary
    end
  end

  def blog_page_css_class_name
    blog_article_page? ? 'p-blog-article' : 'p-blog-index'
  end
end
