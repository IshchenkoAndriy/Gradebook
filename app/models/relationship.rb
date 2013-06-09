class Relationship < ActiveRecord::Base
  attr_accessible :parent_id, :student_id

  validates :parent, :student, :presence => true
  validates_uniqueness_of :student_id, :scope => [:parent_id]

  belongs_to :parent
  belongs_to :student
end
