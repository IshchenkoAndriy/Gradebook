class Subject < ActiveRecord::Base
  attr_accessible :name, :subject_type_id
  
  belongs_to :subject_type
  has_many :double_classes, :dependent => :destroy
  
  validates :subject_type, :presence => true
  validates :name, :presence => true, :uniqueness => true
  
  def to_hash
    Hash[
      :id => self.id,
      :name => self.name,
      :type_id => self.subject_type_id,
      :type_name => self.subject_type.name
    ]
  end

  def all_lessons_info(student_in_group)
    double_classes_info = []
    DoubleClass.where(subject_id: self.id, study_group_id: student_in_group.study_group_id).each do |double_class|
      presence = double_class.presence_on_lessons_count(student_in_group.student)
      total_presence = double_class.total_lessons_count(student_in_group.student)

      lessons_marks = []
      double_class.lessons.each do |lesson|
        lessons_mark = lesson.lesson_marks.where(student_id: student_in_group.student_id).first
        if lessons_mark.nil?
          lessons_marks << {
              :lessons_name => '%s %s' % [double_class.double_class_type.name, lesson.description],
              :score => nil
          }
        else
          lessons_marks << {
              :lessons_name => '%s %s' % [double_class.double_class_type.name, lesson.description],
              :score => lessons_mark.score
          }
        end
      end

      double_class_info = { :lessons => lessons_marks }
      double_class_info.merge!({:presence => presence.to_f / total_presence.to_f}) unless total_presence == 0
      if lessons_marks.count > 0
        double_class_info.merge!({:avg_score => lessons_marks.inject(0) {
            |sum, lesson_mark| sum + lesson_mark[:score].to_i
        } / lessons_marks.count})
      end
      double_classes_info << double_class_info
    end
    double_classes_info
  end
end
