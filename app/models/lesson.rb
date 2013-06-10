class Lesson < ActiveRecord::Base
  attr_accessible :description

  belongs_to :double_class
  has_many :lesson_marks, :dependent => :destroy
  has_many :presences, :dependent => :destroy

  validates :double_class, :description, :presence => true
end
