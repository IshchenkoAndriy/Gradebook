class AddClassroomNumberToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :classroom_number, :integer
  end
end
