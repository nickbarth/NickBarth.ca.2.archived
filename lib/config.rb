class NickBarthCa < Sinatra::Base
  configure do
    set :views, 'app/views'
  end

  configure :development do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :production do
    set :haml, { format: :html5, ugly: true }
    set :sass, { style: :compressed }
  end
end
