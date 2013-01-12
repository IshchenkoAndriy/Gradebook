class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.references :student, :null => false
      t.references :study_type, :null => false
      t.references :double_class, :null => false
      
      t.date :date, :null => false
      t.integer :mark, :null => false
      t.integer :scores, :null => false
      t.integer :study_number
      t.string :study_description

      t.timestamps
    end
  end
end
