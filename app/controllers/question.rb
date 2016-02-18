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

post "/questions/:id/answers" do
  @answer = Answer.create(user_id: current_user.id, question_id: params[:id], content: params[:answer][:content])
  if request.xhr?
    return {content: @answer.content, id: @answer.id, user_id: @answer.user_id}.to_json
  else
    puts "You have failed this city"
  end
end