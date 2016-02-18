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

  erb :"/questions/show"
end

post "/questions/:question_id/comment" do
  user = User.find(session[:user_id])
  question = Question.find(params[:question_id])
  comment = question.comments.create(content: params[:content], user: user)
  if request.xhr?
    content_type :json
    {content: content, username: user.username}.to_json
  else
    redirect "/questions/#{question.id}"
  end
end


# when you click the add comment button, a comment form drops down, the add comment button disappears (magically)
# if you don't add text to the comment form, it will not save and an error pops up
# if you do add text, when you click the button, the comment is saved in the data base, it appears under the question (magically), and the add comment button reappears
