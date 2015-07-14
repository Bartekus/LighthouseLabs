require 'rubygems'
require 'bundler/setup'

require_relative 'config/database'
require_relative 'config/environment'

system ("clear")
establish_connection
LightBrow::Browser.new.run
