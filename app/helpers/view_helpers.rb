class NickBarthCa < Sinatra::Base
  helpers do
    require './app/helpers/view_module'
    include ::ViewHelpers
  end
end
