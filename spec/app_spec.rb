require 'spec_helper'

describe "Sinatra test app" do
  
  describe "Routing" do
    it "should get the main page and display 'Hello World'" do
      visit '/'
      page.should have_content "Hello World"
    end
  end
end