source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.0.4'

# Required for Heroku logs and to serve static assets
gem 'rails_12factor'

gem 'sprockets_better_errors'

# Use unicorn as the app server
gem 'unicorn', '~> 4.8.2'

# Database
# Postgres
gem 'pg', '~> 0.17.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0.6'

# Intercom
gem  'intercom-rails', '~> 0.2.3'

# Devise
gem 'devise', '~> 3.2.4'
gem 'devise_uid', '~> 0.1.0'

# CanCan
gem 'cancan', '~> 1.6.10'

# Amazon S3
gem 'aws-s3', :require => 'aws/s3', :github => 'builtclean/aws-s3'

# Stripe
gem 'stripe', '~> 1.11.0'
gem 'stripe_event', '~> 1.1.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use Less CSS for stylesheets
gem 'less-rails', '~> 2.5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.5.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.1'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', '~> 0.12.1', :platforms => :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.0'
gem 'twitter-bootstrap-rails', '~> 2.2.8'

# Quiet Assets
gem 'quiet_assets', '~> 1.0.2'

# Stylesheet
gem 'sass', '~> 3.2.19'
gem 'sass-rails', '~> 4.0.3'

# Use modernizr for more backward compatibility
gem 'modernizr-rails', '~> 2.7.1'

# Quiet Assets
gem 'quiet_assets', '~> 1.0.2'

# Transloadit
gem 'transloadit-rails', '~> 1.1.1'

# CORS
gem 'rack-cors', '~> 0.2.9', :require => 'rack/cors'

# Rack Timeout
gem 'rack-timeout', '~> 0.0.4'

# Simple Form
gem 'simple_form', '~> 3.0.2'

# New Relic
gem 'newrelic_rpm', '~> 3.7.3.204'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  gem 'rails-perftest'
  gem 'ruby-prof'
  gem 'sqlite3'
end

group :development do
  gem 'debugger'
  gem 'brakeman', :require => false
end

