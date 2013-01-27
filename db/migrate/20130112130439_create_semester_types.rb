class CreateSemesterTypes < ActiveRecord::Migration
  def up
    create_table :semester_types do |t|
      t.integer :id
      t.string :name, :null => false

      t.timestamps
    end
  end
  def down
    drop_table :semester_types
  end
end
