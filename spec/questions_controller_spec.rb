require "spec_helper"

describe "Questions RESTful API" do
  
  describe "Questions list" do
    it "should be succesful" do
      visit "/questions"
    end
    
    it "should display a list of questions" do
      visit "/questions"
      page.should have_content("Questions")
    end
  end
  
  describe "Show question" do
    
    describe "Success" do
      before(:each) do
        @question = FactoryGirl.create(:question)
      end
    
      it "should be succesful" do
        visit "/questions/#{@question.id}"
      end
    
      it "should display a question" do
        visit "/questions/#{@question.id}"
        page.should have_content(@question.question)
      end
    end
    
    describe "Failure" do
      it "should display 404 with wrong ID" do
        get "/questions/115"
        last_response.status.should == 404
      end
    end
    
  end
  
  describe "New question" do
    it "should be succesful" do
      visit "/questions/new"
    end
  end
  
  describe "Add question" do
    it "should be succesful" do
      post "/questions"
      last_response.should be_ok
    end
    
    it "should add a valid question" do
      @attr = FactoryGirl.build(:question).attributes
      expect {
        post "/questions", :question => @attr
      }.to change(Question, :count).by(1)
      page.should have_content(question.question)
    end
  end
  
  describe "Edit question" do
    before(:each) do
      @question = FactoryGirl.create(:question)
    end
    
    it "should be succesful" do
      visit "/questions/#{@question.id}/edit"
    end
    
    it "should change the question content" do
      @attr = {:question => "Changed question"}
      put "/questions/#{@question.id}", :question => @attr
      question.reload!
      question.question.should == @attr[:question]
    end
    
    describe "Failure" do
      it "should display 404 with wrong ID" do
        get "/questions/#{@question.id + 2}/edit"
        last_response.status.should == 404
      end
    end
  end
  
  describe "Delete question" do
    before(:each) do
      @question = FactoryGirl.create(:question)
    end
      
    it "should be succesful" do
      delete "/questions/#{@question.id}"
      last_response.should be_ok
    end
    
    it "should delete the question" do
      expect {
        delete "/questions/#{@question.id}"
      }.to change(Question, :count).by(-1)
    end
  end
end