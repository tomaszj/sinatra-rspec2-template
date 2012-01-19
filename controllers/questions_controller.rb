get "/questions" do
  erb :"questions/index"
end

get "/questions/new" do
  erb :"questions/new"
end

get "/questions/:id" do |id|
  erb :"questions/show"
end

