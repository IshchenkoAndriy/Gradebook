class Semester < ActiveRecord::Base
  attr_accessible :year, :title

  has_many :study_groups, :dependent => :destroy
  
  accepts_nested_attributes_for :study_groups
  
  validates :year, :title, :presence => true
  
  def name
    self.year.to_s + " " + self.title
  end
  
  def to_hash
    Hash[
      :id => self.id,
      :year => self.year,
      :title => self.title
    ]
  end
end
