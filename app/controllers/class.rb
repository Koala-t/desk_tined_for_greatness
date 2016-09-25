get '/class/index' do
  if currentUser.is_teacher
    erb :'teachers/class'
  else
    erb :'students/class'
  end
end