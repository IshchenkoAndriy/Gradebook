class Teacher < Person
  attr_accessible :science_degree_id
  
  belongs_to :science_degree
  has_many :double_classes, :dependent => :destroy
  
  validates :science_degree, :presence => true
end