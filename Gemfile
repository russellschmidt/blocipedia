source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

group :production do
  # use PostGreSQL as database for Active Record
  gem 'pg'
  # use rails_12factor for serving the asset pipeline up on heroku
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'faker'
  gem 'factory_girl_rails', "~> 4.0"
end

group :test do
  # test coverage reports
  gem 'simplecov', require: false
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# Removed to work with Foundation
gem 'turbolinks'

# Install HAML for rails
gem 'haml-rails', '~> 0.9'

gem 'devise'

gem 'foundation-rails'

gem 'shoulda'

gem 'pundit'

gem 'stripe'
gem 'figaro', '~>1.0'

gem 'stripe-ruby-mock', '~> 2.2.1', require: 'stripe_mock'
gem 'redcarpet'

gem 'friendly_id', '~> 5.1.0'

gem 'epiceditor', '~> 0.2.2.2'
