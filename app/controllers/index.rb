get '/' do
	redirect '/questions'
end

get '/questions' do #List all questions on Index
	@questions = Question.all
	erb :index
end


