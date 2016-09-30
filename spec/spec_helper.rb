require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'rack/test'
require 'rspec'
require 'factory_girl'
require 'support/factory_girl'

# set test environment

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
end

RSpec.configure { |c| c.include RSpecMixin }

