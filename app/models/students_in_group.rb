class StudentsInGroup < ActiveRecord::Base
  attr_accessible :study_group_id, :student_id, :scholarship, :hostel, :subgroup
  
  belongs_to :study_group
  belongs_to :student
  
  validates :study_group, :student, :presence => true
  validates :subgroup, :numericality => { :only_integer => true }
  validates :scholarship, :hostel, :inclusion => { :in => [true, false] }
  validates_uniqueness_of :student_id, :scope => [:study_group_id]

  default_scope order('subgroup ASC')
  
  def full_name
    self.student.full_name
  end

  def study_info(subject)
    subject_marks = {}
    (1..NUMBER_OF_MODULES).to_a.each do |study_module|
      presence_mark = Presence.get_score(subject.id, self.study_group_id, self.student_id, study_module)
      lesson_mark = LessonMark.get_score(subject.id, self.study_group_id, self.student_id, study_module)
      additional_mark = AdditionalMark.get_score(subject.id, self.study_group_id, self.student_id, study_module)
      subject_marks.merge!({
          study_module => {
              :presence_mark => presence_mark,
              :lesson_mark => lesson_mark,
              :additional_mark => additional_mark
          }
        }
      )
    end
    subject_marks
  end
end
