get "/questions/ask" do
	# if current_user
	erb :'/questions/ask'
	# else
	# 	redirect '/login'
	# end
end

post "/questions" do
	@question = Question.create(params[:question])
	current_user.questions << @question
	redirect "/questions/#{@question.id}"
end

get "/questions/:id/answers" do
  @answer = Answer.where(question_id: params[:id])
  erb :"/questions/answers"
end
