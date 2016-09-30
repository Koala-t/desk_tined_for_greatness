helpers do
  # does the input value = the question answer?
  def correct?(question, submitted_value)
    first = question.first.to_i
    second = question.second.to_i
    # helper function to get the selected operator (+,-...)
    operation = operator(question.category)
    
    solution = first.send(operation, second)
    # check if the solution to the question equals the input
    solution == submitted_value.to_i
  end

  # return number of correct and incorrect answers
    # for a certain user
    # for a certain question-type
  def pullRecord(type, user)
    results = user.results.where(question_type: type)
    correct = results.where(correct: true).count
    incorrect = results.where(correct: false).count

    {correct: correct, incorrect: incorrect}
  end

  # return a string displaying the percentage of correct answers
    # a particular user has provided
    # for questions of a particular type
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

  def recommendations(type, user)
    records = user.results.where(correct: false).where(question_type: type)
    organizedRecords = {}
    records.each do |record|
      first = organizedRecords[record.first_number]
      second = organizedRecords[record.second_number]
      if first
        organizedRecords[record.first_number] += 1
      else
        organizedRecords[record.first_number] = 0
      end

      if second
        organizedRecords[record.second_number] += 1
      else
        organizedRecords[record.second_number] = 0
      end
    end

    results = []
    3.times do
      max = 0
      candidate = nil
      organizedRecords.each do |number, times_incorrect|
        if times_incorrect > max
          max = times_incorrect
          candidate = number
          p candidate
        end
      end
      results << candidate
      organizedRecords.delete(candidate)
    end
    return results
  end

  # def find_nums()
  #   correct_nums = {}
  #   incorrect_nums = {}

  #   Result.all.each do |result|
  #     one = result.first_number
  #     two = result.second_number

  #     if result.correct
  #       correct_nums[one] = 0 if correct_nums[one] == nil
  #       correct_nums[two] = 0 if correct_nums[two] == nil
  #       correct_nums[one] += 1
  #       correct_nums[two] += 1
  #     else
  #       incorrect_nums[one] = 0 if incorrect_nums[one] == nil
  #       incorrect_nums[two] = 0 if incorrect_nums[two] == nil
  #       incorrect_nums[one] += 1
  #       incorrect_nums[two] += 1
  #     end
  #   end
  #   return {correct: correct_nums, incorrect: incorrect_nums}
  # end

  def find_correct_nums(results)
    correct_nums = {}

    for i in 0..10
      correct_nums[i] = 0
    end

    results.each do |result|
      one = result.first_number
      two = result.second_number

      if result.correct
        correct_nums[one] += 1 if correct_nums[one]
        correct_nums[two] += 1 if correct_nums[two]
      end
    end
    return correct_nums
  end

  def find_incorrect_nums(results)
    incorrect_nums = {}

    for i in 0..10
      incorrect_nums[i] = 0
    end

    results.each do |result|
      one = result.first_number
      two = result.second_number

      if !result.correct
        incorrect_nums[one] += 1 if incorrect_nums[one]
        incorrect_nums[two] += 1 if incorrect_nums[two]
      end
    end
    return incorrect_nums
  end

  # returns a hash of a number,
    # the # of times it's been in a correctly answered question
    # the # of times it's been in an incorrectly answered question
    # the percentage of correct answers
  def list_class_results_by_number(results)
    correct = find_correct_nums(results)
    incorrect = find_incorrect_nums(results)
    results = {}

    correct.each do |number, responses|
      wrong = incorrect[number]
      total = wrong + responses
      results[number] = {
        correct: responses,
        incorrect: wrong,
      }
      if wrong == 0
        results[number][:percentage] = 100 
      else
        results[number][:percentage] = ((responses.to_f / total.to_f) * 100.0).round
      end
    end
    results
  end
  # def list_correct_num_results()
  #   correct = []
  #   results = find_nums()

  #   results[:correct].each do |number|
  #     num = number[0]
  #     answers = number[1]
  #     # add percentage calculation later
  #     correct.push("#{num}  -  #{answers}")
  #   end

  #   return correct
  # end

  # def list_incorrect_num_results()
  #   incorrect = []
  #   results = find_nums()

  #   results[:incorrect].each do |number|
  #     num = number[0]
  #     answers = number[1]
  #     # add percentage calculation later
  #     incorrect.push("#{num}  -  #{answers}")
  #   end

  #   return incorrect
  # end
end