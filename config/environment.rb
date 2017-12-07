require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'app'
require_relative '../lib/country_methods.rb'
require_relative '../lib/type_methods.rb'
require_relative '../lib/weapon_methods.rb'
require_relative '../lib/methods.rb'
require_relative '../lib/ascii.rb'
