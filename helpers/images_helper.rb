module ImagesHelper
  def blog_image_path(article, type)
    image_path("#{article.eponymous_directory_path}#{article.data[type]}")
  end

  def page_image_path(filename)
    image_path("#{current_page.eponymous_directory_path}#{filename}")
  end
end
