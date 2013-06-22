require 'rubygems'
require 'sinatra'
require 'json'

require './app/message.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/logger')
DataMapper.auto_upgrade!

set :haml, :format => :html5

get '/' do
  @messages = Message.all

  haml :index
end

get '/messages.json' do
 content_type :json
 @messages = Message.all.to_json
end
