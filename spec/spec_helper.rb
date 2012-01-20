require 'app'
require 'rspec'
require 'capybara/rspec'
require 'rack/test'
require 'factory_girl'
require 'factories'
require 'database_cleaner'

set :environment, :test

def app
  Sinatra::Application
end

Capybara.app = app

# This overrides ok? method, to allow 302 redirection.
Rack::Response::Helpers.module_eval do
  def ok?
    @status == 200 or self.redirect?
  end
end
# End of patch

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Capybara::DSL
  
  # Database cleaner is needed to provide transaction functionality for Factory Girl
  conf.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  conf.before(:each) do
    DatabaseCleaner.start
  end

  conf.after(:each) do
    DatabaseCleaner.clean
  end
end
