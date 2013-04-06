class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :double_class, :null => false

      t.integer :numerator_denominator, :null => false
      t.integer :subgroup, :null => false
      t.integer :double_class_number, :null => false
      t.integer :day_of_week, :null => false

      t.timestamps
    end
  end
end
