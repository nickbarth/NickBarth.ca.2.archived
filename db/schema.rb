require 'sinatra'
require 'active_record'
require 'active_support/core_ext/string/strip'
require 'fileutils'


Dir['./app/models/*.rb'].each { |file| require file }

class NickBarthCa 
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3',
                                          database: 'db/database.sqlite3',
                                          pool: 4,
                                          timeout: 240,
                                          wait_timeout: 0.24)
end
