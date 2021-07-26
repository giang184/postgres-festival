require 'sinatra'
require 'sinatra/reloader'
require './lib/stage'
require './lib/artist'
also_reload 'lib/**/*.rb'
require 'pry'
require("pg")

DB = PG.connect({ dbname: 'festival_practice', host: 'db', user: 'postgres', password: 'password' })

get '/' do
  "This is connected to the database #{DB.db}."
end
