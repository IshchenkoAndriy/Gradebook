class SemesterType < ActiveRecord::Base
  attr_accessible :id, :name
  
  has_many :semesters, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => true
end
