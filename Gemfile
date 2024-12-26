# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", github: "rails/rails"

# Drivers
gem "pg"
gem "redis", ">= 4.0.1"

# Deployment
gem "puma", ">= 5.0"

# Jobs
gem "resque", "~> 2.6.0"
gem "resque-pool", "~> 0.7.1"

# Frontend
gem "importmap-rails"

gem "propshaft"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

# Others
gem "devise", "4.9.4"
gem "inline_svg", "1.9.0"

# gem "jbuilder"
# gem "redcarpet", "~> 3.6"
# gem "rouge", "~> 4.2"
# gem "bcrypt", "~> 3.1.7"
# gem "image_processing", "~> 1.2"
# gem "rqrcode"
# gem "thruster"
# gem "useragent", github: "basecamp/useragent"
# gem "front_matter_parser"

group :development, :test do
  gem "arlequin"
  gem "brakeman", require: false
  gem "debug"
  gem "faker", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
