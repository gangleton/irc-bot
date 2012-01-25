require 'rubygems'
require 'sinatra'

require './message.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/logger')
DataMapper.auto_migrate!

get '/' do
  "Hello logger"
end
