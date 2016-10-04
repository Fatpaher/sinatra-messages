require 'haml'
require 'sequel'
require 'sinatra/reloader' if development?
require 'active_support/core_ext/numeric/time'
require 'attr_encrypted'

Sequel::Model.plugin :timestamps

require'./config/enviroments'
require './models/message'

module Sequel
  class Model
    def save!(opts = OPTS)
      save({ raise_on_failure: true }.merge opts)
    end
  end
end
