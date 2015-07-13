activate :bower

set :css_dir,     'assets/stylesheets'
set :images_dir,  'assets/images'
set :js_dir,      'assets/javascripts'

configure :build do
  activate :minify_css
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets
end
