class StudyType < ActiveRecord::Base
  attr_accessible :name
  translates :name
  
  has_many :marks, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => true 
end
