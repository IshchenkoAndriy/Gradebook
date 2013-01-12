class CreateSemesterTypes < ActiveRecord::Migration
  def up
    create_table :semester_types do |t|
      t.integer :id
      t.string :name, :null => false

      t.timestamps
    end
    SemesterType.create_translation_table! :name => :string
  end
  def down
    drop_table :semester_types
    SemesterType.drop_translation_table!
  end
end
