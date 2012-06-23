#!/usr/bin/env ruby

require 'bundler'
Bundler.require

require 'sinatra/base'
require 'active_record'
require 'logger'
require 'open-uri'

Dir['./lib/extensions/**/*.rb'].each { |file| require file }
Dir['./lib/config.rb'].each { |file| require file }
Dir['./app/**/*.rb'].each { |file| require file }

run NickBarthCa.new 
