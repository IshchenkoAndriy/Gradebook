class Presence < ActiveRecord::Base
  attr_accessible :was_present, :student_id, :lesson_id, :module
  
  belongs_to :student
  belongs_to :lesson
  
  validates :student, :lesson, :presence => true
  validates :was_present, :inclusion => { :in => [true, false] }
  validates :module, :numericality => { :only_integer => true }
end
