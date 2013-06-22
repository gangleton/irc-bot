require 'isaac'
require './app/message.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/logger')
DataMapper.auto_upgrade!

configure do |c|
  c.nick = ENV['IRC_BOT_NICKNAME']
  c.server = ENV['IRC_SERVER']
  c.port = ENV['IRC_PORT']
  c.verbose = true
end

on :connect do
  join ENV['IRC_CHANNEL']
end

on :channel, /.*/ do
  m = Message.create(:name => nick.to_s, :message => message, :time => Time.now)

  unless m.saved?
    puts "message could not be saved"
  end

  puts "#{channel}: #{nick}: #{message}"
end
