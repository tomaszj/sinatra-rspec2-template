require "spec_helper"

describe "Questions RESTful API" do
  
  before(:each) do
    puts "Question count: #{Question.count}"
  end
  
  describe "Questions list" do
    it "should load a list of questions" do
      visit "/questions"
      page.should have_content("Questions")
    end
  end
  
  describe "Show question" do
    it "should display a question" do
      question = FactoryGirl.create(:question)
      
      visit "/questions/#{question.id}"
      page.should have_content(question.question)
    end
  end
  
  describe "Add question" do
    it "should add a valid question" do
      @attr = FactoryGirl.build(:question).attributes
      post "/questions", :question => @attr
      Question.count.should == 1
      page.should have_content(question.question)
    end
  end
  
  describe "Edit question" do
    it "should change the question content" do
      question = FactoryGirl.create(:question)
      @attr = {:question => "Changed question"}
      
      put "/questions/#{question.id}", :question => @attr
      question.reload!
      question.question.should == @attr[:question]
    end
  end
  
  describe "Delete question" do
    it "should delete the question" do
      FactoryGirl.create(:question)
      initial_count = Question.count
      delete "/questions/#{question.id}"
      Question.count.should == initial_count - 1
      
    end
  end
end