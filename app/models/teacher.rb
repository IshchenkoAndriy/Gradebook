class Teacher < Person
  attr_accessible :science_degree_id
  
  belongs_to :science_degree
  has_many :double_classes, :dependent => :destroy
  has_many :study_groups, :dependent => :destroy
  
  validates :science_degree, :presence => true
end