class AddLessonToMarks < ActiveRecord::Migration
  def up
    add_column :marks, :lesson_id, :integer, :null => false
    add_column :marks, :type, :string, :null => false
    remove_column :marks, :mark
  end

  def down
    remove_column :marks, :lesson_id
    remove_column :marks, :type
    add_column :marks, :mark, :integer
  end
end
