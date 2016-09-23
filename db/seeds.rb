TeachersStudents.delete_all
Teacher.delete_all
Student.delete_all
Result.delete_all
User.delete_all

students = ["tommy", "tammy", "terence", "Lilly"]

students.each do |name|
  Student.create(name: name)
end

teacher = Teacher.create(name: "Mr/Mrs Smith")

results = [
  {first_number: 1, second_number: 1, correct: true, question_type: "addition", student: Student.find_by(name: "tommy")},
  {first_number: 2, second_number: 2, correct: true, question_type: "addition", student: Student.find_by(name: "tommy")},
  {first_number: 3, second_number: 3, correct: true, question_type: "addition", student: Student.find_by(name: "tammy")},
  {first_number: 4, second_number: 4, correct: true, question_type: "addition", student: Student.find_by(name: "tammy")},
  {first_number: 5, second_number: 5, correct: true, question_type: "addition", student: Student.find_by(name: "terence")},
  {first_number: 6, second_number: 6, correct: true, question_type: "addition", student: Student.find_by(name: "terence")},
  {first_number: 7, second_number: 7, correct: true, question_type: "addition", student: Student.find_by(name: "Lilly")},
  {first_number: 8, second_number: 8, correct: true, question_type: "addition", student: Student.find_by(name: "Lilly")},
]

results.each do |result|
  Result.create(result)
end


Student.all.each do |student|
  TeachersStudents.create(student: student, teacher: teacher)
end

users = ["tommy", "tammy", "terence", "Lilly", "Mr Smith"]

users.each do |user|
  if user != "Mr Smith"
    User.create(name: user, is_teacher: false)
  else
    User.create(name: user, is_teacher: true)
  end
end