#!/usr/bin/env ruby

require 'bundler'
Bundler.require

Dir['./lib/config.rb'].each { |file| require file }
Dir['./app/**/*.rb'].each { |file| require file }

run NickBarthCa.new 
