# TeachersStudents.delete_all
# Teacher.delete_all
# Student.delete_all
Result.delete_all
User.delete_all

# students = ["tommy", "tammy", "terence", "Lilly"]

# students.each do |name|
#   Student.create(name: name)
# end

# teacher = Teacher.create(name: "Mr/Mrs Smith")




# Student.all.each do |student|
#   TeachersStudents.create(student: student, teacher: teacher)
# end

users = ["tommy", "tammy", "terence", "Lilly", "Mr Smith"]

users.each do |user|
  if user != "Mr Smith"
    User.create(name: user, is_teacher: false)
  else
    User.create(name: user, is_teacher: true)
  end
end

teacher = User.find_by(is_teacher: true)

User.all.each do |user|
  teacher.students << user if !user.is_teacher
end

results = [
  {first_number: 1, second_number: 1, correct: true, question_type: "addition", student_id: User.find_by(name: "tommy").id},
  {first_number: 2, second_number: 2, correct: true, question_type: "addition", student_id: User.find_by(name: "tommy").id},
  {first_number: 3, second_number: 3, correct: true, question_type: "addition", student_id: User.find_by(name: "tammy").id},
  {first_number: 4, second_number: 4, correct: true, question_type: "addition", student_id: User.find_by(name: "tammy").id},
  {first_number: 5, second_number: 5, correct: true, question_type: "addition", student_id: User.find_by(name: "terence").id},
  {first_number: 6, second_number: 6, correct: true, question_type: "addition", student_id: User.find_by(name: "terence").id},
  {first_number: 7, second_number: 7, correct: true, question_type: "addition", student_id: User.find_by(name: "Lilly").id},
  {first_number: 8, second_number: 8, correct: true, question_type: "addition", student_id: User.find_by(name: "Lilly").id},
]

results.each do |result|
  Result.create(result)
end
categories = ['addition', 'subtraction', 'multiplication']
numbers = [0,1,2,3,4,5,6,7,8,9]
correct? = [true, false]
users = [1,2,3,4]

users.each do |user|
  this_user = User.find(user)
  categories.each do |category|
    numbers.each do |number|
      Question.create(category: category, first: number, second: number)
      Result.create(first_number: number, second_number: number, question_type: category, correct: correct?.sample, student: this_user)
    end
  end
end




