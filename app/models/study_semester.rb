class StudySemester < ActiveRecord::Base
  attr_accessible :semester_id, :group_id, :teacher_id
  
  has_many :students_in_groups, :dependent => :destroy
  has_many :students, :through => :students_in_groups
  has_many :double_classes, :dependent => :destroy
  
  validates :semester, :group, :teacher, :presence => true
end
