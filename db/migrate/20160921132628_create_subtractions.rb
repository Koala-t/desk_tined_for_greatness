class CreateSubtractions < ActiveRecord::Migration
  def change
    create_table :subtractions do |t|
      t.integer  :first_number
      t.integer  :second_number
      t.boolean  :correct
      t.references :student
      
      t.timestamps :start_time
    end
  end
end
