get '/questions/new' do
  erb :'partials/_questionForm'
end

post '/questions' do
  question = Question.new(category: params[:category],
                          first: number(params[:maxValue]),
                          second: number(params[:maxValue]))
  if question.save
    session[:question_id] = question.id
    redirect :'partials/_questionDisplay'
  else
    redirect :'questions/new'
  end
end

get '/partials/_questionDisplay' do
  @question = Question.find(session[:question_id])
  erb :'partials/_questionDisplay'
end

post '/questions/quick' do
  question = Question.new(category: params[:category],
                          first: number(params[:first]),
                          second: number(params[:second]))
  if question.save
    # need ajax to continue
    redirect :'partials/_questionDisplay'
  else
    redirect :'questions/new'
  end
end