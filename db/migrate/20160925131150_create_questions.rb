class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string   :category
      t.string   :first
      t.string   :second

      t.timestamps(null: false)
    end
  end
end
