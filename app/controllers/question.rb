get "/questions/ask" do
	if current_user
	erb :'/questions/ask'
	else
		redirect '/login'
	end
end

post "/questions" do
  puts "*" * 50
	@question = Question.create(params[:question])
	current_user.questions << @question
	redirect "/questions/#{@question.id}"
end
get "/questions/:id" do
  @question = Question.find(params[:id])
  @answers = Answer.where(question_id: params[:id])
  erb :"/questions/show"
end

