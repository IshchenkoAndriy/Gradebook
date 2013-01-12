class CreateScienceDegrees < ActiveRecord::Migration
  def up
    create_table :science_degrees do |t|
      t.string :name, :null => false

      t.timestamps
    end
    ScienceDegree.create_translation_table! :name => :string
  end
  def down
    drop_table :science_degrees
    ScienceDegree.drop_translation_table!
  end
end
