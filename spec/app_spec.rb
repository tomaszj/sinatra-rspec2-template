require 'app'
require 'rspec'
require 'rack/test'

set :environment, :test

describe "Sinatra test app" do
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  describe "Routing" do
    it "should get the main page" do
      get '/'
      last_response.should be_ok
    end
  end
end