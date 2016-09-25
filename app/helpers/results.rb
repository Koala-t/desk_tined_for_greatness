helpers do
  def correct?(question, submitted_value)
    first = question.first.to_i
    second = question.second.to_i
    operation = operator(question.category)
    
    solution = first.send(operation, second)

    solution == submitted_value.to_i
  end
end