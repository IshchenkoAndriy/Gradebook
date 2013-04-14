class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :double_class, :null => false
      t.date :date, :null => false

      t.timestamps
    end
  end
end
