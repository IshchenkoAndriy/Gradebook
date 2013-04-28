class RenameSecondNameToLastNameInPeople < ActiveRecord::Migration
  def up
    rename_column :people, :second_name, :last_name
  end

  def down
    rename_column :people, :last_name, :second_name
  end
end
