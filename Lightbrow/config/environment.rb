require 'active_record'
require 'pry'
require "net/http"
require 'uri'
require 'nokogiri'
require 'colorize'

require_relative '../app/models/browser'
require_relative '../app/models/html_page'
require_relative '../app/models/history'

# Work on this... maybe
# APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
# APP_NAME = APP_ROOT.basename.to_s

# require APP_ROOT.join('config', 'database')

# # require ::File.expand_path('config/environment', __FILE__)
