class CreateStudyTypes < ActiveRecord::Migration
  def up
    create_table :study_types do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
  def down
    drop_table :study_types
  end
end
