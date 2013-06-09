class Parent < Person
  attr_accessible :relationships_attributes
  has_many :relationships
  has_many :students, :through => :relationships

  accepts_nested_attributes_for :relationships, :allow_destroy => true

  def to_hash
    {
        :parent => self.full_name,
        :phone => self.phone
    }
  end
end