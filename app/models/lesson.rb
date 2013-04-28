class Lesson < ActiveRecord::Base
  attr_accessible :date, :description

  belongs_to :double_class
  has_many :lesson_marks, :dependent => :destroy

  validates :double_class, :date, :description, :presence => true
end
