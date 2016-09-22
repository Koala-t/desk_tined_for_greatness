Teacher.delete_all
Student.delete_all
Result.delete_all
TeachersStudents.delete_all

students = ["tommy", "tammy", "terence", "Lilly"]

students.each do |name|
  Student.create(name: name)
end

teacher = Teacher.create(name: "Mr/Mrs Smith")

results = [
  {first_number: 1, second_number: 1, correct: true, question_type: "addition", student: Student.find(1)},
  {first_number: 2, second_number: 2, correct: true, question_type: "addition", student: Student.find(1)},
  {first_number: 3, second_number: 3, correct: true, question_type: "addition", student: Student.find(2)},
  {first_number: 4, second_number: 4, correct: true, question_type: "addition", student: Student.find(2)},
  {first_number: 5, second_number: 5, correct: true, question_type: "addition", student: Student.find(3)},
  {first_number: 6, second_number: 6, correct: true, question_type: "addition", student: Student.find(3)},
  {first_number: 7, second_number: 7, correct: true, question_type: "addition", student: Student.find(4)},
  {first_number: 8, second_number: 8, correct: true, question_type: "addition", student: Student.find(4)},
]

results.each do |result|
  Result.create(result)
end


Student.all.each do |student|
  TeachersStudents.create(student: student, teacher: teacher)
end