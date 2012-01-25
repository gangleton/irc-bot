#!/usr/bin/env ruby

require 'rubygems'
require 'isaac'

require './message.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/logger.db")
DataMapper.auto_migrate!

configure do |c|
  c.nick = "NOLAbot"
  c.server = "irc.freenode.net"
  c.port = 6665
  c.verbose = true
end

on :connect do
  join "#cfaNOLA"
end

on :channel, /.*/ do
  Message.create(:name => nick, :message => message, :time => Time.now)

  open("#{channel}.log", "a") do |log|
    log.puts "[#{Time.now.strftime("%c")}] #{nick}: #{message}"
  end

  puts "#{channel}: #{nick}: #{message}"
end
