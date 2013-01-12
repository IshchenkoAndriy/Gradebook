class Student < Person
  has_many :students_in_groups, :dependent => :destroy
  has_many :study_semesters, :through => :students_in_groups
  has_many :marks, :dependent => :destroy
  has_many :presences, :dependent => :destroy
end