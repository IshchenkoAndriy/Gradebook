class Group < ActiveRecord::Base
  attr_accessible :name
  
  has_many :study_groups, :dependent => :destroy
end
