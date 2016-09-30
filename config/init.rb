require'./config/enviroments'
require './config/migrations'
Sequel::Model.plugin :timestamps
require './models/message'

module Sequel
  class Model
    def save!(opts = OPTS)
      save({ raise_on_failure: true }.merge opts)
    end
  end
end
