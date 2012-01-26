#!/usr/bin/env ruby

require 'rubygems'
require 'isaac'

require './message.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/logger')
DataMapper.auto_upgrade!

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
  m = Message.create(:name => nick.to_s, :message => message, :time => Time.now)

  unless m.saved?
    puts "message could not be saved"
  end

  puts "#{channel}: #{nick}: #{message}"
end
