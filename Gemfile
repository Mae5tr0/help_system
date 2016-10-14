source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Database
gem 'mysql2', '~> 0.3.18'

# JSON
gem 'active_model_serializers', '~> 0.10.0'
gem 'responders'

# Stylesheets
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'

# JS
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Backbone framework
gem 'backbone-on-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Architecture
gem 'dotenv-rails', '2.1.1'

# Authentication
gem 'devise'
gem 'cancancan'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spec
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'

  gem 'better_errors'
  gem 'binding_of_caller'

  # Code quality
  gem 'rubocop'
end

