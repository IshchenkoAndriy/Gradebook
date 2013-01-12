class DoubleClassType < ActiveRecord::Base
  attr_accessible :name
  translates :name
  
  has_many :double_classes, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => true 
end
