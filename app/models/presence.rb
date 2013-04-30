class Presence < ActiveRecord::Base
  attr_accessible :was_present, :student_id, :lesson_id, :module
  
  belongs_to :student
  belongs_to :lesson
  
  validates :student, :lesson, :presence => true
  validates :was_present, :inclusion => { :in => [true, false] }
  validates_uniqueness_of :student_id, :scope => [:lesson_id]
  validates :module, :numericality => { :only_integer => true,
                                        :greater_than_or_equal_to => 1,
                                        :less_than_or_equal_to => NUMBER_OF_MODULES }
end
