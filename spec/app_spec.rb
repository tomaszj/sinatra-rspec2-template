require 'spec_helper'

describe "Sinatra test app" do
  
  describe "Routing" do
    it "should get the main page" do
      get '/'
      last_response.should be_ok
    end
  end
end