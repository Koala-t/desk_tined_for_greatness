get '/sessions/new' do
  if request.xhr?
    erb :'partials/_loginForm', layout: false
  else
    erb :'partials/_loginForm'
  end
end

post '/sessions' do
  if User.find_by(name: params[:name]) && User.find_by(id: params[:id])
    session[:id] = params[:id]
    @user = currentUser
    if request.xhr?
          p '_______________________ajax__________________'

      if currentUser.is_teacher
        p '____________________teacher_____________'
        erb :'partials/_teacherMenu', layout: false
      else
        # why does this line run twice
        p '____________________student_____________'
        erb :'partials/_studentMenu', layout: false
      end
    else
      p '____________________not___ajax______1____________'
      redirect :"/users/#{session[:id]}"
    end

  else
    # add message for incorrect entry with ajax
    p '____________________not___ajax________2__________'
    redirect :'/sessions/new'
  end
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end