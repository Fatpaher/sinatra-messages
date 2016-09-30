source 'https://rubygems.org'
gem 'sinatra'
gem 'sinatra-activerecord' # excellent gem that ports ActiveRecord for Sinatra

group :development, :test do
  gem 'sqlite3'
  gem 'rspec'
  gem 'capybara'
end

group :production do
  gem 'pg' # this gem is required to use postgres on Heroku
end

