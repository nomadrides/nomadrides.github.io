xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title     data.site.name
  xml.subtitle  data.site.baseline
  xml.id        host_url(blog.options.prefix.to_s)
  xml.link      "href" => host_url(blog.options.prefix.to_s)
  xml.link      "href" => host_url(current_page.path), "rel" => "self"

  xml.author { xml.name data.site.author }

  unless blog.articles.empty?
    xml.updated(blog.articles.first.date.to_time.iso8601)
  end

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title     article.title
      xml.link      "rel" => "alternate", "href" => host_url(article.url)
      xml.id        host_url(article.url)
      xml.published article.date.to_time.iso8601
      xml.updated   File.mtime(article.source_file).iso8601
      xml.summary   article.summary, "type" => "html"
      xml.content   article.body, "type" => "html"

      xml.author { xml.name article.data['author'] }
    end
  end
end
