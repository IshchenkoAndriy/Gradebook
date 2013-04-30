class LessonMark < Mark
  attr_accessible :lesson_id

  belongs_to :lesson

  validates :lesson, :presence => true
  validates_uniqueness_of :student_id, :scope => [:lesson_id]
end
