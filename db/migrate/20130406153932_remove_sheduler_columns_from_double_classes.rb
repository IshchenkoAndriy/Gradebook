class RemoveShedulerColumnsFromDoubleClasses < ActiveRecord::Migration
  def up
    remove_column :double_classes, :numerator_denominator
    remove_column :double_classes, :subgroup
    remove_column :double_classes, :double_class_number
    remove_column :double_classes, :day_of_week
  end

  def down
    add_column :double_classes, :numerator_denominator, :integer
    add_column :double_classes, :subgroup, :integer
    add_column :double_classes, :double_class_number, :string
    add_column :double_classes, :day_of_week, :integer
  end
end
