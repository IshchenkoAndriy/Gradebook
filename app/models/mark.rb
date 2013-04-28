class Mark < ActiveRecord::Base
  attr_accessible :date, :score, :module, :student_id

  belongs_to :student
  
  validates :student, :date, :score, :module, :presence => true
  validates :score, :module, :numericality => { :only_integer => true }
end
