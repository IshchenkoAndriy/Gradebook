class StudyGroup < ActiveRecord::Base
  attr_accessible :semester_id, :group_id, :teacher_id
  
  belongs_to :semester
  belongs_to :group
  belongs_to :teacher
  
  has_many :students_in_groups, :dependent => :destroy
  has_many :students, :through => :students_in_groups
  has_many :double_classes, :dependent => :destroy
  
  validates :semester, :group, :teacher, :presence => true
end
