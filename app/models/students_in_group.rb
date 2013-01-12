class StudentsInGroup < ActiveRecord::Base
  attr_accessible :study_semester_id, :student_id, :scholarship, :hostel, :subgroup
  
  belongs_to :study_semester
  belongs_to :student
  
  validates :study_semester, :student, :presence => true
  validates :subgroup, :numericality => { :only_integer => true }
  validates :scholarship, :hostel, :inclusion => { :in => [true, false] }
end
