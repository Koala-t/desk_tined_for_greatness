class CreateTeacher < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string   :name

      t.timestamps null: false
    end
  end
end

# do I need the Class table or is that a bunch of associations?

class CreateStudent < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string   :name

      t.timestamps null: false
    end
  end
end


class CreateAddition < ActiveRecord::Migration
  def change
    create_table :additions do |t|
      t.references :student

      t.timestamps null: false
    end
  end
end