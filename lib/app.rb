require 'bundler'
Bundler.require

require './lib/config'
Dir['./app/**/*.rb'].each { |file| require file }
