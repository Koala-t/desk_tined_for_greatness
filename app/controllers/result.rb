post '/results' do
  question = Question.find(session[:question_id])
  result = Result.new(first_number: question.first,
                      second_number: question.second,
                      question_type: question.category,
                      correct: correct?(question, params[:answer]),
                      student: currentUser)

  if result.save
    if request.xhr?
      #check if the answer was right and return confirmation
      if result.correct
        "Correct!"
      else
        "Being terrible at something is the first step to being sorta good at something."
      end
    else
      redirect :'questions/new'
    end
  else
    redirect :'partials/_questionDisplay'
  end
end