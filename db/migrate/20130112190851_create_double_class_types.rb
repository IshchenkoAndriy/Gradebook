class CreateDoubleClassTypes < ActiveRecord::Migration
  def up
    create_table :double_class_types do |t|
      t.string :name, :null => false

      t.timestamps
    end
    DoubleClassType.create_translation_table! :name => :string
  end
  def down
    drop_table :double_class_types
    DoubleClassType.drop_translation_table!
  end
end
