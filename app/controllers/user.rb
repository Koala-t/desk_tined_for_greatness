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
  if request.xhr?
    erb :'students/history', layout: false
  else
    erb :'students/history'
  end
end

get'/users/:id/history/:type' do
  @user = User.find(params[:id])
  @type = params[:type]

  if request.xhr?
    erb :'partials/_additionTable', layout: false
  else
    erb :'partials/_additionTable'
  end
end

get '/users/:id/classHistory' do
  @class = currentUser.students
  if request.xhr?
    erb :'teachers/classHistory', layout: false
  else
    erb :'teachers/classHistory'
  end
end