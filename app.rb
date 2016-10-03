require 'rubygems'
require 'sinatra'
require './config/init'

get '/' do
  haml :form
end

post '/' do
  @message = Message.new(params[:message])
  if @message.valid?
    @message.save
    haml :link
  else
    "Sorry there was an error!"
  end
end

get '/:link' do
  @message=Message[params[:link]]
  haml :message
end
