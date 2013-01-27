class CreateScienceDegrees < ActiveRecord::Migration
  def up
    create_table :science_degrees do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
  def down
    drop_table :science_degrees
  end
end
