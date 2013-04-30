class Mark < ActiveRecord::Base
  attr_accessible :date, :score, :module, :student_id

  belongs_to :student
  
  validates :student, :date, :score, :module, :presence => true
  validates :score, :numericality => { :only_integer => true,
                                       :greater_than_or_equal_to => MIN_SCORE_VALUE,
                                       :less_than_or_equal_to => MAX_SCORE_VALUE }
  validates :module, :numericality => { :only_integer => true,
                                        :greater_than_or_equal_to => 1,
                                        :less_than_or_equal_to => NUMBER_OF_MODULES }
end
