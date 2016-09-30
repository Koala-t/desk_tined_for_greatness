helpers do
  def collection(type, students)
    collection = []
    students.each do |student|
      collection << student.results.where(question_type: type)
    end
    collection.flatten
  end

  def total(type, students)
    students.reduce(0) { |memo, student| memo += student.results.where(question_type: type).count}
  end

  def correct(type, students)
    students.reduce(0) { |memo, student| memo += student.results.where(question_type: type, correct: true).count}
  end

  def classPercentage(type, students)
    tot = total(type, students).to_f
    cor = correct(type, students).to_f
    if tot == 0
      "The class has not answered any #{type} questions yet!"
    else
      "#{((cor / tot) * 100.0).round}% correct out of #{tot.to_i} questions"
    end
  end
end