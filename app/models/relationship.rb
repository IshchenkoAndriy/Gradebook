class Relationship < ActiveRecord::Base
  attr_accessible :parent_id, :student_id

  validates :parent, :student, :presence => true

  belongs_to :parent
  belongs_to :student
end
