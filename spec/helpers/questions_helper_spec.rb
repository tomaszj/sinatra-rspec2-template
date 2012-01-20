require "spec_helper"

describe "ViewHelper" do
  include Sinatra::ViewHelper
  
  describe "question paths" do
    it "should return questions path" do
      questions_path.should == "/questions"
    end
    
    it "should return specific question path" do
      question_path(1).should == "/questions/1"
    end
    
    it "should return new question path" do
      new_question_path.should == "/questions/new"
    end
    
    it "should return specific question edit path" do
      edit_question_path(1).should == "/questions/1/edit"
    end
  end
end