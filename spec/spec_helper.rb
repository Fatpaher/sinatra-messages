require 'rack/test'
require 'rspec'
require 'factory_girl'
require 'support/factory_girl'
require 'support/database_cleaner'
require 'capybara/rspec'
require 'database_cleaner'
require 'pry'

# require "./config/environment"
require File.expand_path '../../app', __FILE__

ENV['RACK_ENV'] = 'test'
DB = database
Capybara.app = Sinatra::Application

module RSpecMixin
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
end

RSpec.configure do |c|
  c.include RSpecMixin
  c.include Capybara::DSL, feature: true
  c.include Capybara::RSpecMatchers, feature: true
end
