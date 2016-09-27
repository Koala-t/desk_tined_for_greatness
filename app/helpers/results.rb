helpers do
  def correct?(question, submitted_value)
    first = question.first.to_i
    second = question.second.to_i
    # helper function to get the selected operator (+,-...)
    operation = operator(question.category)
    
    solution = first.send(operation, second)
    # check if the solution to the question equals the input
    solution == submitted_value.to_i
  end

  def pullRecord(type, user)
    addition = user.results.where(question_type: type)
    correct = addition.where(correct: true).count
    incorrect = addition.where(correct: false).count

    {correct: correct, incorrect: incorrect}
  end

  def percentage(type, user)
    record = pullRecord(type, user)
    if (record[:correct] + record[:incorrect]) == 0
      "You have not answered any questions of this type yet."
    else
      correct = record[:correct].to_f
      total = (correct + record[:incorrect]).to_f
      "#{((correct / total) * 100.0).round}% correct out of #{total.to_i} questions"
    end
  end

  def find_nums()
    correct_nums = {}
    incorrect_nums = {}

    Result.all.each do |result|
      one = result.first_number
      two = result.second_number

      if result.correct
        correct_nums[one] = 0 if correct_nums[one] == nil
        correct_nums[two] = 0 if correct_nums[two] == nil
        correct_nums[one] += 1
        correct_nums[two] += 1
      else
        incorrect_nums[one] = 0 if incorrect_nums[one] == nil
        incorrect_nums[two] = 0 if incorrect_nums[two] == nil
        incorrect_nums[one] += 1
        incorrect_nums[two] += 1
      end
    end
    p correct_nums
    return {correct: correct_nums, incorrect: incorrect_nums}
  end

  def list_correct_num_results()
    correct = []
    results = find_nums()

    results[:correct].each do |number|
      num = number[0]
      answers = number[1]
      # add percentage calculation later
      correct.push("#{num}  -  #{answers}")
    end

    return correct
  end

  def list_incorrect_num_results()
    incorrect = []
    results = find_nums()

    results[:incorrect].each do |number|
      num = number[0]
      answers = number[1]
      # add percentage calculation later
      incorrect.push("#{num}  -  #{answers}")
    end

    return incorrect
  end
end