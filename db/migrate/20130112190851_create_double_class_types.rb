class CreateDoubleClassTypes < ActiveRecord::Migration
  def up
    create_table :double_class_types do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
  def down
    drop_table :double_class_types
  end
end
