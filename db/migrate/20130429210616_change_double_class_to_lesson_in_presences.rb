class ChangeDoubleClassToLessonInPresences < ActiveRecord::Migration
  def up
    rename_column :presences, :double_class_id, :lesson_id
  end

  def down
    rename_column :presences, :lesson_id, :double_class_id
  end
end
