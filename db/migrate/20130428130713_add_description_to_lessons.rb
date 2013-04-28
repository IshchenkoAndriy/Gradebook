class AddDescriptionToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :description, :string, :null => false
  end
end
