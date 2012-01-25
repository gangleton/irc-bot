require 'rubygems'
require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id,      Serial
  property :name,    String
  property :time,    DateTime
  property :message, Text
end
