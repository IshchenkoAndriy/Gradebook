class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :student_id, :null => false
      t.integer :parent_id, :null => false

      t.timestamps
    end
  end
end
