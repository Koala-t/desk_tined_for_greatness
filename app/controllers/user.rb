get '/users/:id' do
  @user = currentUser
  if @user.is_teacher
    erb :'teachers/show'
  else
    erb :'students/show'
  end
end