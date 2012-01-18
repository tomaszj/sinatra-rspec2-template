require 'app'
require 'rspec'
require 'capybara/rspec'
require 'rack/test'
require 'factory_girl'

set :environment, :test

def app
  Sinatra::Application
end

Capybara.app = app

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Capybara::DSL
end
