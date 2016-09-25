post '/results' do
  question = Question.find(session[:question_id])
  result = Result.new(first_number: question.first,
                      second_number: question.second,
                      question_type: question.category,
                      correct: correct?(question, params[:answer]),
                      student: currentUser)

  if result.save
    redirect :'questions/new'
  else
    redirect :'partials/_questionDisplay'
  end
end