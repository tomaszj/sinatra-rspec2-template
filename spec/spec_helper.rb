require 'app'
require 'rspec'
require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
