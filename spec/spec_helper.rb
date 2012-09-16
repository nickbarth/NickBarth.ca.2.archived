require './lib/app'

require 'rack/test'
require 'capybara/rspec'

class Sinatra::Base; set :environment, :test; end

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
