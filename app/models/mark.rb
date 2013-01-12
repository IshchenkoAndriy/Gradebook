class Mark < ActiveRecord::Base
  attr_accessible :date, :mark, :scores, :study_description, :study_number, :study_type_id, :student_id, :double_class_id
  
  belongs_to :study_type
  belongs_to :student
  belongs_to :double_class
  
  validates :study_type, :student, :double_class, :date, :mark, :scores, :presence => true
  validates :scores, :mark, :numericality => { :only_integer => true }
end
