require 'pry'
require 'rspec'
require 'colorize'

def safely_require(file)
  require_relative file
rescue LoadError
  # ignore
end

safely_require '../lib/amphibian'
safely_require '../lib/animal'
safely_require '../lib/backbone'
safely_require '../lib/bat'
safely_require '../lib/chimpanzee'
safely_require '../lib/flight'
safely_require '../lib/frog'
safely_require '../lib/mammal'
safely_require '../lib/parrot'
safely_require '../lib/primate'
safely_require '../lib/swim'
