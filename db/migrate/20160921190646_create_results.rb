class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer  :first_number
      t.integer  :second_number
      t.boolean  :correct
      t.string   :question_type
      t.references :student
      
      t.timestamps :start_time
    end
  end
end
