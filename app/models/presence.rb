class Presence < ActiveRecord::Base
  attr_accessible :was_present, :student_id, :lesson_id, :module
  
  belongs_to :student
  belongs_to :lesson
  
  validates :student, :lesson, :presence => true
  validates :was_present, :inclusion => { :in => [true, false] }
  validates_uniqueness_of :student_id, :scope => [:lesson_id]
  validates :module, :numericality => { :only_integer => true,
                                        :greater_than_or_equal_to => 1,
                                        :less_than_or_equal_to => NUMBER_OF_MODULES }

  def self.get_score(subject_id, study_group_id, student_id, study_module)
    #  double_class has different presence mark
    sum = 0
    DoubleClass.where(subject_id: subject_id, study_group_id: study_group_id).each do |double_class|
      total_presence_mark = Presence.joins(:lesson).where(
          :lessons => {:double_class_id => double_class.id},
          :student_id => student_id,
          :was_present => true,
          :module => study_module
      ).count
      sum = sum + total_presence_mark * double_class.presence_score
    end
    sum
  end
end
