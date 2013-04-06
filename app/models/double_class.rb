class DoubleClass < ActiveRecord::Base
  attr_accessible :study_group_id, :double_class_type_id, :subject_id, :teacher_id, :schedules_attributes
      
  belongs_to :study_group
  belongs_to :double_class_type
  belongs_to :subject
  belongs_to :teacher
  has_many :marks, :dependent => :destroy
  has_many :presences, :dependent => :destroy
  has_many :schedules, :dependent => :destroy

  validates :study_group, :double_class_type, :subject, :teacher, :presence => true

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
