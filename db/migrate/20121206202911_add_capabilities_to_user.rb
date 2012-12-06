class AddCapabilitiesToUser < ActiveRecord::Migration
  def change
    add_column :users, :capabilities_mask, :integer, :default => 0
  end
end
