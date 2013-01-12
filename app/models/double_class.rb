class DoubleClass < ActiveRecord::Base
  attr_accessible :day_of_week, :double_class_number, :numerator_denominator, :subgroup,
    :study_semester_id, :double_class_type_id, :subject_id, :teacher_id
      
  belongs_to :study_semester
  belongs_to :double_class_type
  belongs_to :subject
  belongs_to :teacher
  has_many :marks, :dependent => :destroy
  has_many :presences, :dependent => :destroy
  
  validates :study_semester, :double_class_type, :subject, :teacher, :presences => true
end
