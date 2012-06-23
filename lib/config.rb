class NickBarthCa < Sinatra::Base
  configure do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3',
                                            database: 'db/database.sqlite3',
                                            pool: 4,
                                            timeout: 240,
                                            wait_timeout: 0.24)
    set :views, 'app/views'
  end

  configure :development do
    set :sessions => true
    enable :logging, :dump_errors, :raise_errors
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  configure :production do
    set :haml, { format: :html5, ugly: true }
    set :sass, { style: :compressed }
  end

  before { ActiveRecord::Base.verify_active_connections! }
  after  { ActiveRecord::Base.clear_active_connections! }
end
