class CreateStudyGroups < ActiveRecord::Migration
  def change
    create_table :study_groups do |t|
      t.references :semester, :null => false
      t.references :group, :null => false
      t.references :teacher, :null => false
      
      t.timestamps
    end
  end
end
