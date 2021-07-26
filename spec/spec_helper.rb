require 'rspec'
require 'pg'
require 'pry'
require 'stage'

DB = PG.connect({ dbname: 'festival_practice_test', host: 'db', user: 'postgres', password: 'password' })

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stages *;")
    DB.exec("DELETE FROM artists *;")
  end
end
