class CreateStudyTypes < ActiveRecord::Migration
  def up
    create_table :study_types do |t|
      t.string :name, :null => false

      t.timestamps
    end
    StudyType.create_translation_table! :name => :string
  end
  def down
    drop_table :study_types
    StudyType.drop_translation_table!
  end
end
