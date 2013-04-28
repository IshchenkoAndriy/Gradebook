class AddPresenceScoreToDoubleClasses < ActiveRecord::Migration
  def change
    add_column :double_classes, :presence_score, :integer, :null => false
  end
end
