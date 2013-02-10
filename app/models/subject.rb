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
end
