require 'haml'
require 'sinatra/sequel'
require 'sinatra/reloader' if development?
require 'active_support/core_ext/numeric/time'

Sequel::Model.plugin :timestamps

require'./config/enviroments'
require './models/message'
require './config/migrations'

module Sequel
  class Model
    def save!(opts = OPTS)
      save({ raise_on_failure: true }.merge opts)
    end
  end
end
