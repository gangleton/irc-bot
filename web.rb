require 'rubygems'
require 'sinatra'

require './message.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/logger')
DataMapper.auto_upgrade!

get '/' do
  messages = Message.all
  messages.each do |m|
    "#{m.name} said #{m.message}"
  end
end
