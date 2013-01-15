class Subject < ActiveRecord::Base
  attr_accessible :name, :subject_type_id
  
  belongs_to :subject_type
  has_many :double_classes, :dependent => :destroy
  
  validates :subject_type, :presence => true
  validates :name, :presence => true, :uniqueness => true
end
