class ChangeSemestersTable < ActiveRecord::Migration
  def up
    add_column :semesters, :year, :integer, :null => false
    add_column :semesters, :title, :string, :null => false
    remove_column :semesters, :begin_date
    remove_column :semesters, :end_date
    remove_column :semesters, :semester_type_id
  end

  def down
    remove_column :semesters, :year
    remove_column :semesters, :title
    add_column :semesters, :begin_date, :date, :null => false
    add_column :semesters, :end_date, :date, :null => false
    add_column :semesters, :semester_type_id, :integer, :null => false
  end
end
