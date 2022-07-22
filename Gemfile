source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'discogs-wrapper'
gem 'haml-rails'
gem 'jsbundling-rails'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'rails', github: 'rails/rails', branch: '7-0-stable'
gem 'redcarpet'
gem 'sprockets-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'webmock'
end
