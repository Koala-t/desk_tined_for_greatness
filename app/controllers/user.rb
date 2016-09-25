get '/users/:id' do
  @user = currentUser
  if @user.is_teacher
    erb :'teachers/show'
  else
    erb :'students/show'
  end
end

get '/users/:id/history' do
  @user = currentUser
  erb :'students/history'
end