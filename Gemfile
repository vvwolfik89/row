source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.7'
# Use sqlite3 as the database for Active Record
# gem 'pg'
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'execjs'
gem 'therubyracer'


# UI Gems
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
gem 'jquery-ui-rails'
# gem 'bootstrap-sass'
gem 'bootstrap-datepicker-rails'
gem 'simple_form'
gem 'RedCloth'
gem 'rack-cors', require: 'rack/cors'
gem 'font-awesome-rails'
gem 'active_link_to'
gem 'render_async'
gem 'cocoon'
gem 'rails-observers', git: 'https://github.com/rails/rails-observers.git'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.30'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'minitest-reporters'
  gem 'mocha'
  gem 'webmock'
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'rails-controller-testing'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Refinery CMS
gem 'refinerycms', '~> 4.0'

# Optionally, specify additional Refinery CMS Extensions here:
gem 'refinerycms-acts-as-indexed', ['~> 3.0', '>= 3.0.0']
gem 'refinerycms-wymeditor', ['~> 2.0', '>= 2.0.0']
gem 'refinerycms-authentication-devise', '~> 2.0'
gem 'refinerycms-i18n'
gem 'refinerycms-bootstrap'
#  gem 'refinerycms-blog', ['~> 4.0', '>= 4.0.0']
#  gem 'refinerycms-inquiries', ['~> 4.0', '>= 4.0.0']
#  gem 'refinerycms-search', ['~> 4.0', '>= 4.0.0']
#  gem 'refinerycms-page-images', ['~> 4.0', '>= 4.0.0']

gem 'refinerycms-employees', path: 'vendor/extensions'
gem 'refinerycms-items', path: 'vendor/extensions'
gem 'refinerycms-departments', path: 'vendor/extensions'
gem 'refinerycms-partners', path: 'vendor/extensions'
gem 'refinerycms-sport_rowings', path: 'vendor/extensions'
gem 'refinerycms-athletes', path: 'vendor/extensions'
gem 'refinerycms-coaches', path: 'vendor/extensions'
gem 'refinerycms-photo-gallery', '~> 0.3.0'
gem 'refinerycms-previews', path: 'vendor/extensions'
gem 'refinerycms-services', path: 'vendor/extensions'
gem 'refinerycms-competitions', path: 'vendor/extensions'