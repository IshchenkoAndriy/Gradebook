class CreateStudySemesters < ActiveRecord::Migration
  def change
    create_table :study_semesters do |t|
      t.references :semester, :null => false
      t.references :group, :null => false
      t.references :teacher, :null => false
      
      t.timestamps
    end
  end
end
