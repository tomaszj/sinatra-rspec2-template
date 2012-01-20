require 'sinatra'
require 'data_mapper'

use Rack::MethodOverride

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

helpers do
  # Allow partial functionality
  def partial(template, locals = {})
    erb(template, :layout => false, :locals => locals)
  end
end

require 'controllers/questions_controller'

get "/" do
  "Hello World!"
end

not_found do
  "404!"
end

error DataMapper::ObjectNotFoundError do
  not_found
end

error do
  "500!"
end