source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Database
gem 'mysql2', '~> 0.3.18'

# JSON
gem 'active_model_serializers', '~> 0.10.0'

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
gem 'decent_exposure'

# State machine
gem 'aasm'

# Authentication
gem 'devise'
gem 'pundit'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'database_cleaner'

  # Spec
  gem 'rspec-rails'
  gem 'shoulda-matchers'

  # web tests
  gem 'cucumber-rails', require: false
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'email_spec'
end

group :development do
  gem 'web-console'

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug'

  # Code quality
  gem 'rubocop'
end

