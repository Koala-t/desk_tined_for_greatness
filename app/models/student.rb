class Student < ActiveRecord::Base
  has_many :additions, class_name: "Addition"
  has_many :subtractions, class_name: "Subtraction"
  has_many :multiplications, class_name: "Multiplication"
  has_many :divisions, class_name: "Division"
end
