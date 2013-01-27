class Person < ActiveRecord::Base
  attr_accessible :birth_day, :email, :first_name, :patronymic, :phone, :second_name
  
  validates :first_name, :second_name, :patronymic, :presence => true
  
  def name
    self.first_name + " " + self.second_name + " " + self.patronymic
  end
end
