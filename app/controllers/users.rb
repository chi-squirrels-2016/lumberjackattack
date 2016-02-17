get '/login' do

  erb :"/user/login"
end

post '/signup' do
  user = User.create(email: params[:email], username: params[:username], password: params[:password])
  session[:user_id] = user.id
  redirect "/questions"
end

post '/login' do
  puts "this is #{params[:email]}"
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}/questions"
  else
    redirect "/"
  end
end

