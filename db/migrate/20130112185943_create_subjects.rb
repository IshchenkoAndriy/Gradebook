class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
      t.string :name, :null => false
      t.references :subject_type, :null => false

      t.timestamps
    end
  end
  def down
    drop_table :subjects
  end
end
