get '/users/:id' do
  @user = currentUser
  if @user.is_teacher
    erb :'teachers/show'
  else
    erb :'students/show'
  end
end

get '/users/:id/history' do
  @user = User.find(params[:id])
  erb :'students/history'
end

get '/users/:id/classHistory' do
  @class = currentUser.students
  erb :'teachers/classHistory'
end