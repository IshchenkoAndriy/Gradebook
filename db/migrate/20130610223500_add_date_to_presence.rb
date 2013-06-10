class AddDateToPresence < ActiveRecord::Migration
  def up
    add_column :presences, :date, :date
    remove_column :lessons, :date
  end

  def down
    remove_column :presences, :date
    add_column :lessons, :date, :date
  end
end
