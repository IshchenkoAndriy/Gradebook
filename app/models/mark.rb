class Mark < ActiveRecord::Base
  attr_accessible :date, :scores, :student_id

  belongs_to :student
  
  validates :student, :date, :scores, :presence => true
  validates :scores, :numericality => { :only_integer => true }
end
