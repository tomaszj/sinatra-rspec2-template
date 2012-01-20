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

get "/questions/:id/edit" do |id|
  @question = Question.get!(id)
  erb :"questions/edit"
end

put "/questions/:id" do |id|
  @question = Question.get!(id)
  if @question.update(params[:question] || {})
    redirect "/questions/#{id}"
  else
    redirect "/questions/#{id}/edit"
  end
    
end

post "/questions" do
  question = Question.create(params[:question])
  if question.save
    redirect "/questions/#{question.id}"
  else
    redirect "/questions/new"
  end
end

delete "/questions/:id" do |id|
  question = Question.get!(id)
  question.destroy
  redirect "/questions"
end
