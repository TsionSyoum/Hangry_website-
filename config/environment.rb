require 'bundler'
Bundler.require

require './app/models/model.rb'

#require './app/models/user'

require './app/models/recipe.rb'


configure :development do
  set :database, "sqlite3:db/database.db"
end
