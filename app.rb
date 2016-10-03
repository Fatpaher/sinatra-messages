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
  @message=Message.find(link: [params[:link]])
  if (@message.option == 'hour') && (@message.created_at + 1.hour <= Time.now)
    @message.delete
    status 404
  else
    haml :message
  end
end
