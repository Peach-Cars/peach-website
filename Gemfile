source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.0"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

gem 'aws-sdk-s3'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Gem for integrating Vite with Rails. Vite is a build tool that provides a fast development server and optimized builds for production.
gem "vite_rails"

# Gem for integrating Inertia.js with Rails. Inertia.js is a framework for building modern single-page applications using server-side routing and controllers.
gem "inertia_rails", git: "https://github.com/inertiajs/inertia-rails"

gem 'sidekiq', '~> 7.0' # Background job processing and caching

gem 'kaminari', '~> 1.2' # Pagination library

gem 'faraday', '~> 2.7' # HTTP client library

gem 'redis', '~> 5.0'       # For interacting with Redis

gem 'redis-rails', '~> 5.0' # For Redis caching in Rails (optional, if you need it)

# For initializing objects with dry-initializer
gem 'dry-initializer'

# For type definitions with dry-types
gem 'dry-types'

# Generate JavaScript routes for Rails
gem "js-routes"

group :development, :test do
  # Adds RSpec for testing Rails applications
  gem "rspec-rails", "~> 6.0"

  # Adds Annotate for adding schema and other metadata comments to models and migrations
  gem "annotate"

  # RuboCop for Ruby code style enforcement
  gem "rubocop", "~> 1.0"

  # RuboCop extension for Rails-specific style checks
  gem "rubocop-rails", "~> 2.0"

  # Standard for consistent Ruby code style
  gem "standard", "~> 1.0"

  # Provides RSpec-specific linting rules for RuboCop. The '~> 2.0' version allows updates within the 2.x range, while `require: false` prevents auto-requiring in production.
gem 'rubocop-rspec', '~> 2.0', require: false

end

gem "tailwindcss-rails", "~> 2.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end