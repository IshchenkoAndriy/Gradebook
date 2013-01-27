class CreateDoubleClasses < ActiveRecord::Migration
  def change
    create_table :double_classes do |t|
      t.references :study_group, :null => false
      t.references :double_class_type, :null => false
      t.references :subject, :null => false
      t.references :teacher, :null => false
      
      t.integer :numerator_denominator
      t.integer :subgroup
      t.string :double_class_number
      t.integer :day_of_week

      t.timestamps
    end
  end
end
