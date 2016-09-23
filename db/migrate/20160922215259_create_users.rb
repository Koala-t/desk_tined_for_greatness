class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name
      t.references :teacher, index: true
      t.boolean  :is_teacher


      t.timestamps(null: false)
    end
  end
end
