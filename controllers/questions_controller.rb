get "/questions" do
  @questions = Question.all
  erb :"questions/index"
end

get "/questions/new" do
  @question = Question.new
  erb :"questions/new"
end

get "/questions/:id" do |id|
  @question = Question.get!(id)
  erb :"questions/show"
end

