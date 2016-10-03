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
    'Sorry there was an error!'
  end
end

get '/:link' do
  @message = Message.find(link: [params[:link]])

  if @message.nil?
    status 404
    return 'Message not found'
  end

  case @message.option
  when 'hour'
    if @message.created_at + 1.hour <= Time.current
      @message.delete
      status 404
      return 'Message not found'
    end
  when 'visit'
    @message.delete
  end
  haml :message
end
