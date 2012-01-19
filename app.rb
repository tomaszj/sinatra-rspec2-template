require 'sinatra'
require 'data_mapper'

configure do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/data/database.db")
  
  class Question
    include DataMapper::Resource

    validates_uniqueness_of :id

    property :id, Serial
    property :question, String
  end
  
  DataMapper.auto_upgrade!
end

require 'controllers/questions_controller'

get "/" do
  "Hello World!"
end
