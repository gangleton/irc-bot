require 'rubygems'
require 'sinatra'

require './message.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/logger.db")
DataMapper.auto_migrate!

get '/' do
  "Hello logger"
end
