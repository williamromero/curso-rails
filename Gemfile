source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'rails', '~> 6.1.6' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'mysql2', '~> 0.5' # Use mysql as the database for Active Record
gem 'puma', '~> 5.0' # Use Puma as the app server
gem 'sass-rails', '>= 6' # Use SCSS for stylesheets
gem 'webpacker', '~> 5.0' # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'jbuilder', '~> 2.7' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'redis', '~> 4.0' # Use Redis adapter to run Action Cable in production
gem 'bcrypt', '~> 3.1.7' # Use Active Model has_secure_password
# gem 'image_processing', '~> 1.2' # Use Active Storage variant

gem 'bootsnap', '>= 1.4.4', require: false # Reduces boot times through caching; required in config/boot.rb

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  
  gem 'annotate'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 4.1.0' # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'   # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
end

group :test do
  gem 'capybara', '>= 3.26' # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver', '>= 4.0.0.rc1' # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
