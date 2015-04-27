source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

group :production do
	gem 'pg'
	gem 'rails_12factor'
end
group :development do
	gem 'sqlite3'
	gem 'rails-erd'
	gem 'pry-rails'
	gem 'better_errors'
	gem 'binding_of_caller'
end
# Populate some fake data
gem 'faker'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bootstrap-sass'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Rspec for testing
  gem 'rspec-rails', '~> 3.0'

  # capybara supports testing by simulating real user interactions
  gem 'capybara'
end

  # Provides modules for user aunthetication
  gem 'devise'
  # Sets up environment configuration securely
  gem 'figaro', '1.0'
  # Handles authorization and user policies
  gem 'pundit'
  # Redcarpet adds Markdown formatting
  gem 'redcarpet'
  # Carrierwave for uploading/storing files
  gem 'carrierwave'
  # mini_magick for image manipulation
  gem 'mini_magick'
  # fog does something with Amazon AWS s3 cloud storage
  gem 'fog'
  # easy pagination
  gem 'will_paginate', '~>3.0.5'
