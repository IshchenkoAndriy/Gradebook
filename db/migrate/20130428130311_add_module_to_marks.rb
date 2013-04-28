class AddModuleToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :module, :integer, :null => false
  end
end
