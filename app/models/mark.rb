class Mark < ActiveRecord::Base
  attr_accessible :date, :score, :student_id

  belongs_to :student
  
  validates :student, :date, :score, :presence => true
  validates :score, :numericality => { :only_integer => true }
end
