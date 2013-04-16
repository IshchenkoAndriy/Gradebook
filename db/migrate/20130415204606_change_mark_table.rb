class ChangeMarkTable < ActiveRecord::Migration
  def up
    change_column :marks, :lesson_id, :integer, :null => true
    change_column :marks, :double_class_id, :integer, :null => true
    change_column :marks, :study_type_id, :integer, :null => true
    rename_column :marks, :scores, :score
  end

  def down
    change_column :marks, :lesson_id, :integer, :null => false
    change_column :marks, :double_class_id, :integer, :null => false
    change_column :marks, :study_type_id, :integer, :null => false
    rename_column :marks, :score, :scores
  end
end
