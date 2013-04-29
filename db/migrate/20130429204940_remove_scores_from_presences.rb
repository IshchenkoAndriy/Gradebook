class RemoveScoresFromPresences < ActiveRecord::Migration
  def up
    remove_column :presences, :scores
  end

  def down
    add_column :presences, :scores, :integer, null: false
  end
end
