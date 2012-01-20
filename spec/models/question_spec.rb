require "spec_helper"

describe Question do
  it "should return valid question from factory" do
    question = FactoryGirl.create(:question)
    question.should be_valid
  end
  
  it "should require non-empty question" do
    question = FactoryGirl.create(:question)
    question.question = ""
    question.should_not be_valid
  end
end
