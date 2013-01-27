class CreateSubjectTypes < ActiveRecord::Migration
  def up
    create_table :subject_types do |t|
      t.string :name, :null => false
      t.boolean :is_rated, :null => false, :default => false

      t.timestamps
    end
  end
  def down
    drop_table :subject_types
  end
end
