class LessonMark < Mark
  attr_accessible :lesson_id

  belongs_to :lesson

  validates :lesson, :presence => true
  validates_uniqueness_of :student_id, :scope => [:lesson_id]

  def self.get_score(subject_id, study_group_id, student_id, study_module)
    LessonMark.joins(:lesson => :double_class).where(
        :lessons => {:double_classes => {
            :subject_id => subject_id,
            :study_group_id => study_group_id
        }},
        :student_id => student_id,
        :module => study_module
    ).sum(:score)
  end
end
