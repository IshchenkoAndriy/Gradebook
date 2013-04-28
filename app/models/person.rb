class Person < ActiveRecord::Base
  attr_accessible :birth_day, :email, :first_name, :patronymic, :phone, :last_name
  
  validates :first_name, :last_name, :patronymic, :presence => true
  
  def full_name
    self.last_name + " " + self.first_name + " " + self.patronymic
  end
  
  def to_hash
    Hash[
      :id => self.id,
      :last_name => self.last_name,
      :first_name => self.first_name,
      :patronymic => self.patronymic
    ]
  end
end
