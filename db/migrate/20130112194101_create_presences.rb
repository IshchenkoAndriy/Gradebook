class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.references :student, :null => false
      t.references :double_class, :null => false
      t.date :date, :null => false
      t.boolean :was_present, :null => false
      t.integer :scores, :null => false

      t.timestamps
    end
  end
end
