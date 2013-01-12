class Presence < ActiveRecord::Base
  attr_accessible :date, :scores, :was_present, :student_id, :double_class_id
  
  belongs_to :student
  belongs_to :double_class
  
  validates :student, :double_class, :date, :scores, :was_present, :presence => true
  validates :scores, :numericality => { :only_integer => true }
  validates :was_present, :inclusion => { :in => [true, false] }
end
