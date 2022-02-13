source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
# Gráficos
gem 'chart-js-rails'   
# Auth routes
gem 'cancancan' 
# savon
gem 'savon', '~> 2.12.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem "roo", "~> 2.8.0"
# rest consumo de api
gem 'http'  
# rest api por shopfacil
gem 'rest-client'  
# emails sender
gem 'sendgrid-actionmailer'
# cache
gem 'dalli', '~> 2.7', '>= 2.7.6'
# Boletos 
gem 'boletosimples'
# cache
gem 'memcachier'
# secret keys
gem "figaro"
# Boletos 
gem 'bradesco_shopfacil', :git => 'https://github.com/gilcierweb/bradesco-shopfacil'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# O BrCep é um gem que tem como objetivo buscar um endereço com base no seu CEP.
gem 'brcep'
#Here's an example entity-relationship diagram that was generated by Rails
gem "rails-erd"
gem 'graphviz', '~> 0.3.0'
group :development do
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-rvm', require: false
end
# Devise
gem 'devise'
# Use Active storage Variant.
gem 'image_processing', '~> 1.2'
# font-awesome-rails.
gem "font-awesome-rails"
#Apartment allows Rack applications to deal with database multitenancy through ActiveRecord.
gem 'ros-apartment', '~> 2.9'
# sendgrid.
gem 'sendgrid-ruby'
# Devise.
gem 'devise' 
# Gem para gerar os pdfs.
gem 'prawn-rails'
# Gem para gerar os gráficos.
gem 'gruff'
# Gem para criar paginação.
gem 'kaminari'
# serve jobs
gem 'redis'
# gerenciar jobs
gem 'sidekiq'
# start jobs
gem 'whenever', require: false
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console.
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
 