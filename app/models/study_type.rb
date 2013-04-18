class StudyType < ActiveRecord::Base
  attr_accessible :name
  
  has_many :additional_marks, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => true 
end
