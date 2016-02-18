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
  @comments = @question.comments
  @username = User.find(session[:user_id]).username
  p @username
  erb :"/questions/show"
end

get "/questions/:question_id/comment/new" do
  if request.xhr?
    erb :"/questions/_comment", layout: false, locals: {question_id: params[:question_id]}
  else
    question_id = Question.find(params[:question_id])
    redirect :"/questions/#{question_id}"
  end
end

post "/questions/:question_id/comment" do
  p params
  user = User.find(session[:user_id])
  question = Question.find(params[:question_id])
  comment = question.comments.create(content: params[:content], user: user)
  if request.xhr?
    erb :"/questions/_add_comment", layout: false, locals: {comment: comment, user: user }
  else
    redirect "/questions/#{question.id}"
  end
end


post "/questions/:id/answers" do
  @answer = Answer.create(user_id: current_user.id, question_id: params[:id], content: params[:answer][:content])
  the_id = params[:id]
  puts the_id
  answers = Answer.where(question_id: params[:id]).to_a
  if request.xhr?
    status 200
    erb :"/questions/_answers", layout: false, locals: { the_id: the_id, answers: answers}
  else
    puts "You have failed this city"
  end
end

post "/questions/:question_id/answers/:answer_id" do
  @answer = Answer.find(params[:answer_id])
  @answer.votes.create(value: 1)
  puts "8" * 60
  redirect "/questions/#{params[:question_id]}"
end


