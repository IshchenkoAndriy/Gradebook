class Semester < ActiveRecord::Base
  attr_accessible :begin_date, :end_date, :semester_type_id
  
  belongs_to :semester_type
  
  validates :begin_date, :end_date, :semester_type, :presence => true
end
