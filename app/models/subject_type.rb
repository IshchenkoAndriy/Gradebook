class SubjectType < ActiveRecord::Base
  attr_accessible :is_rated, :name
  translates :name
  
  has_many :subjects, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => true
  validates :is_rated, :inclusion => { :in => [true, false] }
end
