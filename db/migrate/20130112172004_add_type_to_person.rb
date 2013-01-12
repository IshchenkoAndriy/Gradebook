class AddTypeToPerson < ActiveRecord::Migration
  def change
    add_column :people, :type, :string, :null => false
  end
end
