require 'spec_helper'

describe NickBarthCa do
  include Test::Helpers 

  describe "Website", type: :request do
    it "is working" do
      visit("/")
      page.should have_content('Nick Barth')
    end
  end
end
