activate :autoprefixer
activate :bower
activate :protect_emails

set :css_dir,     'assets/stylesheets'
set :images_dir,  'assets/images'
set :js_dir,      'assets/javascripts'

configure :build do
  activate :minify_css
  activate :minify_html
  activate :minify_javascript

  # Use relative URLs
  # activate :relative_assets
end
