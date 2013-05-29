class Parent < Person
  has_many :relationships
  has_many :students, :through => :relationships

  def to_hash
    {
        :parent => self.full_name,
        :phone => self.phone
    }
  end
end