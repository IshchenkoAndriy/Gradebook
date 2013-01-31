class Group < ActiveRecord::Base
  attr_accessible :name
  
  has_many :study_groups, :dependent => :destroy
  has_many :students_in_groups, :through => :study_groups
end
