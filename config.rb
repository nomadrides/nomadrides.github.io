Time.zone = 'Paris'

activate :autoprefixer
activate :bower
activate :protect_emails

set :css_dir,     'assets/stylesheets'
set :images_dir,  'assets/images'
set :js_dir,      'assets/javascripts'

activate :blog do |blog|
  blog.layout             = 'layouts/blog'
  blog.prefix             = 'blog' # prefix to all links, template refs and source paths

  # article
  blog.default_extension  = '.md'
  blog.permalink          = '{year}-{month}-{day}-{title}.html'
  blog.sources            = 'articles/{year}-{month}-{day}-{title}.html' # source file
  blog.summary_separator  = /(READMORE)/

  # pagination
  blog.paginate           = false
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = :master
end

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_html
  activate :minify_javascript

  activate :robots,   rules:    [{ user_agent: '*', allow: %w(/) }],
                      sitemap:  "#{data.site.url}/sitemap.xml"
  activate :sitemap,  hostname: data.site.url
end

page '/blog/feed.xml', layout: false
