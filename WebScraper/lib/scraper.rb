require_relative 'interface'
require_relative 'parser'
require_relative 'raw_data'
require 'nokogiri'
require 'open-uri'
require 'colorize'


if ARGV.length <= 1
  Interface.display_help
  exit
end

case ARGV[0].downcase
  when 'hn' then post = Parser.hacker_news(ARGV[1])
  when 'rd' then post = Parser.reddit(ARGV[1])
  else
    Interface.invalid_arguments
    exit
end

Interface.display_post(post)
