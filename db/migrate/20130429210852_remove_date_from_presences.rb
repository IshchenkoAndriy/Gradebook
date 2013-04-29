class RemoveDateFromPresences < ActiveRecord::Migration
  def up
    remove_column :presences, :date
  end

  def down
    add_column :presences, :date, :date, :null => false
  end
end
