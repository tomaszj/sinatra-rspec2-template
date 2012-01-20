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

post "/questions" do
  question = Question.create(params[:question])
  if question.save
    redirect "/questions/#{question.id}"
  else
    redirect "/questions/new"
  end
end