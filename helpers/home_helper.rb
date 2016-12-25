module HomeHelper
  def small_article_column?(line_index, article_index)
    line_index % 2 == article_index % 2
  end
end
