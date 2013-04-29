class AddModuleToPresences < ActiveRecord::Migration
  def change
    add_column :presences, :module, :integer, :null => false
  end
end
