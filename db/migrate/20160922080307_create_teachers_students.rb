class CreateTeachersStudents < ActiveRecord::Migration
  def change
    create_table :teachers_students do |t|
      t.references :teacher
      t.references :student

      t.timestamps(null: false)
    end
  end
end
