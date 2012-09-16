require 'sinatra/base'
require 'logger'
require 'open-uri'
require 'rack/test'
require 'capybara/rspec'

class Sinatra::Base; set :environment, :test; end

Dir['./lib/config.rb'].each { |file| require file }
Dir['./app/**/*.rb'].each { |file| require file }

module Test
  module Helpers
    include Rack::Test::Methods
    include Capybara::DSL
    Capybara.app = NickBarthCa

    def app
      NickBarthCa
    end
  end
end
