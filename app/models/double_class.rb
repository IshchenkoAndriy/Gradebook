class DoubleClass < ActiveRecord::Base
  attr_accessible :study_group_id, :double_class_type_id, :subject_id, :teacher_id, :schedules_attributes, :presence_score
      
  belongs_to :study_group
  belongs_to :double_class_type
  belongs_to :subject
  belongs_to :teacher
  has_many :additional_marks, :dependent => :destroy
  has_many :lessons, :dependent => :destroy
  has_many :schedules, :dependent => :destroy
  has_many :lesson_marks, :through => :lessons
  has_many :presences, :through => :lessons

  validates :study_group, :double_class_type, :subject, :teacher, :presence_score, :presence => true

  validates :presence_score, :numericality => { :only_integer => true,
                                       :greater_than_or_equal_to => 0,
                                       :less_than_or_equal_to => MAX_SCORE_VALUE }

  validate do
    update_create_schedules = schedules.reject(&:marked_for_destruction?)
    update_create_schedules.each do |current_schedule|
      day_schedule = update_create_schedules.find_all{ |schedule|
        schedule.day_of_week == current_schedule.day_of_week and
        schedule.double_class_number == current_schedule.double_class_number
      }
      day_schedule.delete current_schedule
      errors[:base] << '' if current_schedule.invalid_schedule?(day_schedule, I18n.t('active_admin.schedule.schedule_exist_for_group'))
    end
  end

  accepts_nested_attributes_for :schedules, :allow_destroy => true

  def name
    self.subject.name
  end

  def schedules_list
    self.schedules.map { |schedule| schedule.to_hash }
  end

  def title
    '%s - %s' % [self.study_group.group.name, self.name]
  end
  
  def to_hash
    Hash[
      :id => self.id,
      :teacher => self.teacher.to_hash,
      :double_class_type => self.double_class_type.to_hash,
      :schedules => self.schedules_list
    ]
  end

  def presence_on_lessons_count(student)
    Presence.joins(:lesson).where(
        :lessons => {:double_class_id => self.id},
        :student_id => student.id,
        :was_present => true
    ).count
  end

  def total_lessons_count(student)
    Presence.joins(:lesson).where(
        :lessons => {:double_class_id => self.id},
        :student_id => student.id
    ).count
  end
end
