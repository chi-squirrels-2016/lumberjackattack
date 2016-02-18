post "/questions/:question_id/votes" do
  @question = Question.find(params[:question_id])
  @question.votes.create(value: 1)
  redirect "/questions/#{@question.id}"
end
