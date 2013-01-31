class Semester < ActiveRecord::Base
  attr_accessible :begin_date, :end_date, :semester_type_id
  
  belongs_to :semester_type
  has_many :study_groups, :dependent => :destroy
  
  accepts_nested_attributes_for :study_groups
  
  validates :begin_date, :end_date, :semester_type, :presence => true
  
  def name
    self.semester_type.name + " | " + self.begin_date.to_s() + " - " + self.end_date.to_s() 
  end
  
  def study_date
    "%s \\ %s" % [self.begin_date.to_s(), self.end_date.to_s()]
  end
  
end
