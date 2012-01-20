require 'sinatra'
require 'data_mapper'

use Rack::MethodOverride

configure do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/data/database.db")
  
  require 'models/question'
  
  DataMapper.auto_upgrade!
end

configure :production do
  set :show_exceptions, false
  set :raise_errors, false
end

helpers do
  # Allow partial functionality
  def partial(template, locals = {})
    erb(template, :layout => false, :locals => locals)
  end
  
  # Load helpers from helpers.rb
  require 'helpers'
  
end

# Load Questions controller code
require 'controllers/questions_controller'

get "/" do
  "Hello World!"
end

not_found do
  erb :'404'
end

error DataMapper::ObjectNotFoundError do
  not_found
end

error do
  erb :'500'
end