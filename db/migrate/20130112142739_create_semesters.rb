class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.date :begin_date, :null => false
      t.date :end_date, :null => false
      t.references :semester_type, :null => false

      t.timestamps
    end
  end
end
