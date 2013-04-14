class LessonMark < Mark
  attr_accessible :lesson_id

  belongs_to :lesson

  validates :lesson, :presence => true
end
