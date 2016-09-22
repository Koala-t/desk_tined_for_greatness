class Student < ActiveRecord::Base
  has_many :results, class_name: "Result"
end
