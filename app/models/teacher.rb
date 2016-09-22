class Teacher < ActiveRecord::Base
  has_many :teachers_students, class_name: "TeachersStudents"
  has_many :students, through: :teachers_students
  has_many :class_results, through: :students, source: :results
end
