class StudentsInGroup < ActiveRecord::Base
  attr_accessible :study_group_id, :student_id, :scholarship, :hostel, :subgroup
  
  belongs_to :study_group
  belongs_to :student
  
  validates :study_group, :student, :presence => true
  validates :subgroup, :numericality => { :only_integer => true }
  validates :scholarship, :hostel, :inclusion => { :in => [true, false] }
end
