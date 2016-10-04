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
  @message = Message.find(link: params[:link])
  unless @message
    status 404
    return 'Message not found'
  end

  option_value = @message.option_value
  case @message.option
  when 'hour'
    if @message.created_at + option_value.hours <= Time.current
      @message.delete
      status 404
      return 'Message not found'
    end
  when 'visit'
    option_value -= 1
    @message.update(option_value: option_value)
    @message.delete if option_value <= 0
  end
  haml :message
end
