class Group < ActiveRecord::Base
  attr_accessible :name
  
  has_many :study_groups, :dependent => :destroy
  has_many :students_in_groups, :through => :study_groups
  
  def to_hash
    @semesters = Array.new
    self.study_groups.each do |study_group|
      @semesters << Hash[:semester => study_group.semester.to_hash, :curator => study_group.teacher.to_hash ]
    end
    Hash[
      :id => self.id,
      :name => self.name,
      :semesters => @semesters
    ]
  end
end
