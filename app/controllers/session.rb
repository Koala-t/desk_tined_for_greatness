get '/sessions/new' do
  erb :'partials/_loginForm'
end

post '/sessions' do
  if User.find_by(name: params[:name]) && User.find_by(id: params[:id])
    session[:id] = params[:id]
    
    redirect :"/users/#{session[:id]}"
  else
    # add message for incorrect entry with ajax
    redirect :'/sessions/new'
  end
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end