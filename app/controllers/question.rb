get '/questions/new' do
  erb :'partials/_questionForm'
end

post '/questions' do
  p '------------------------------'
  p params[:category]
  session[:question] = generateQuestion(params[:category], params[:maxValue])
  redirect :'partials/_questionDisplay'
end

get '/partials/_questionDisplay' do
  erb :'partials/_questionDisplay'
end