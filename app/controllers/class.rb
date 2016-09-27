get '/class/index' do
  if request.xhr?
    if currentUser.is_teacher
      erb :'teachers/class', layout: false
    else
      erb :'students/class', layout: false
    end
  else
    if currentUser.is_teacher
      erb :'teachers/class'
    else
      erb :'students/class'
    end
  end
end