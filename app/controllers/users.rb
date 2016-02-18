get '/login' do

  erb :"/user/login"
end

post '/signup' do
  user = User.new(email: params[:email], username: params[:username], password: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect "/questions"
  else
    @errors = user.errors.full_messages
    erb :"/user/login"
  end
end

post '/login' do
  puts "this is #{params[:email]}"
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/questions"
  else
    @unmatch = "That password doesn't match!"
    erb :"/user/login"
  end
end

delete '/logout' do
  session.clear[:user_id]
  redirect "/login"
end
