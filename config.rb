::Sass.load_paths << File.join(root, 'node_modules')

Time.zone = 'Paris'

set :css_dir,     'assets/stylesheets'
set :fonts_dir,   'assets/fonts'
set :images_dir,  'assets/images'
set :js_dir,      'assets/javascripts'

activate :autoprefixer
activate :protect_emails

activate :external_pipeline,
  name: :webpack,
  command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
  source: ".tmp/dist",
  latency: 1

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

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_html, remove_input_attributes: false
  activate :minify_javascript

  activate :robots, rules:    [{ user_agent: '*', allow: %w(/) }],
                    sitemap:  "#{@app.data.site.url}/sitemap.xml"

  activate :sitemap, hostname: @app.data.site.url

  # # "Ignore" JS so webpack has full control.
  ignore { |path| path =~ /\/(.*)\.js$/ && $1 != 'all.bundle' }
end

activate :deploy do |deploy|
  deploy.deploy_method  = :git
  deploy.branch         = 'master'
  deploy.build_before   = true
end

page '/blog/feed.xml', layout: false
