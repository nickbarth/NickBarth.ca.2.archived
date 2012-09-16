class NickBarthCa < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/css/:style.css' do
    sass(:"sass/#{params[:style]}")
  end
end
