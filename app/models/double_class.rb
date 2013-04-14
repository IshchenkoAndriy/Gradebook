class DoubleClass < ActiveRecord::Base
  attr_accessible :study_group_id, :double_class_type_id, :subject_id, :teacher_id, :schedules_attributes
      
  belongs_to :study_group
  belongs_to :double_class_type
  belongs_to :subject
  belongs_to :teacher
  has_many :additional_marks, :dependent => :destroy
  has_many :lessons, :dependent => :destroy
  has_many :presences, :dependent => :destroy
  has_many :schedules, :dependent => :destroy

  validates :study_group, :double_class_type, :subject, :teacher, :presence => true

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
  
  def to_hash
    Hash[
      :id => self.id,
      :teacher => self.teacher.to_hash,
      :double_class_type => self.double_class_type.to_hash,
      :schedules => self.schedules_list
    ]
  end
end
