require 'sinatra/base'
require 'active_record'
require 'logger'
require 'open-uri'
require 'rack/test'
require 'capybara/rspec'

class Sinatra::Base; set :environment, :test; end

Dir['./lib/extensions/**/*.rb'].each { |file| require file }
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
