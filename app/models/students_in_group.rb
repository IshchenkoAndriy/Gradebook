class StudentsInGroup < ActiveRecord::Base
  attr_accessible :study_group_id, :student_id, :scholarship, :hostel, :subgroup
  
  belongs_to :study_group
  belongs_to :student
  
  validates :study_group, :student, :presence => true
  validates :subgroup, :numericality => { :only_integer => true }
  validates :scholarship, :hostel, :inclusion => { :in => [true, false] }
  validates_uniqueness_of :student_id, :scope => [:study_group_id]

  default_scope joins(:student).order('people.last_name ASC, subgroup ASC')
  
  def full_name
    self.student.full_name
  end
end
