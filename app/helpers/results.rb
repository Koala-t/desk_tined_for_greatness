helpers do
  def correct?(question, submitted_value)
    first = question.first.to_i
    second = question.second.to_i
    operation = operator(question.category)
    
    solution = first.send(operation, second)

    solution == submitted_value.to_i
  end

  def pullRecord(type)
    user = currentUser
    addition = currentUser.results.where(question_type: type)
    correct = addition.where(correct: true).count
    incorrect = addition.where(correct: false).count

    {correct: correct, incorrect: incorrect}
  end

  def percentage(type)
    record = pullRecord(type)
    if (record[:correct] + record[:incorrect]) == 0
      "You have not answered any questions of this type yet."
    else
      correct = record[:correct].to_f
      total = (correct + record[:incorrect]).to_f
      "#{((correct / total) * 100.0).round}% correct out of #{total.to_i} questions"
    end
  end
end