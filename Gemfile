source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.1'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use Puma as the app server                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'bootsnap', require: false
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'bootstrap-sass'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'kaminari'
gem 'stripe'
gem 'unicorn'
gem 'rails-i18n'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'sass'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem "aws-sdk-s3", require: false
gem 'toastr-rails', '~> 1.0', '>= 1.0.3'
gem 'remotipart'
gem 'pundit'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'rspec_junit_formatter'
  gem 'factory_bot_rails', '~> 4.11'
  gem 'capybara', '~> 2.13.0'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'vcr'
  gem 'webmock','>= 3.5'
  gem 'launchy'
end

group :development do
  gem 'rack-mini-profiler', require: false
  gem 'bullet'
  #productionでも見たい
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'dotenv-rails'
gem 'faraday'