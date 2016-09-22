class Student < ActiveRecord::Base
  has_many :results, class_name: "Result"
  has_many :teachers_students, class_name: "TeachersStudents"
  has_many :teachers, through: :teachers_students
end
