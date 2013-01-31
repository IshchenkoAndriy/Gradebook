class CreatePeople < ActiveRecord::Migration
  def up
    create_table :people do |t|
      t.string :first_name, :null => false
      t.string :second_name, :null => false
      t.string :patronymic, :null => false
      t.string :birth_day, :null => false, :default => ""
      t.string :phone, :null => false, :default => ""
      t.string :email, :null => false, :default => ""

      t.timestamps
    end
  end
  def down
  end
end
