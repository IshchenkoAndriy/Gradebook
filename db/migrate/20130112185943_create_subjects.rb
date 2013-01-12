class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
      t.string :name, :null => false
      t.references :subject_type, :null => false

      t.timestamps
    end
    Subject.create_translation_table! :name => :string
  end
  def down
    drop_table :subjects
    Subject.drop_translation_table!
  end
end
