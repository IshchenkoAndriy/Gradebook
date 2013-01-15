class DoubleClassType < ActiveRecord::Base
  attr_accessible :name
  
  has_many :double_classes, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => true 
end
