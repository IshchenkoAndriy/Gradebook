class CreateStudentsInGroups < ActiveRecord::Migration
  def change
    create_table :students_in_groups do |t|
      t.references :study_semester, :null => false
      t.references :student, :null => false
      t.boolean :scholarship, :null => false, :default => false
      t.boolean :hostel, :null => false, :default => false
      t.integer :subgroup, :null => false, :default => 0

      t.timestamps
    end
  end
end
