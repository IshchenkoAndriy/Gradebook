class RemoveSemesterTypesTable < ActiveRecord::Migration
  def up
    drop_table :semester_types
  end

  def down
    create_table :semester_types do |t|
      t.integer :id
      t.string :name, :null => false

      t.timestamps
    end
  end
end
