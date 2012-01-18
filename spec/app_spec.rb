require 'app'
require 'rack/test'

describe "Sinatra test app" do
  describe "Routing" do
    it "should get the main page" do
      get "/"
    end
  end
end