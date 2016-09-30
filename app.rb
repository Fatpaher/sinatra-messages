require 'rubygems'
require 'sinatra'
require 'sequel'
require 'sinatra/sequel'
require './config/init'

get '/' do
  'Hello world'
end
