class Teacher < Person
  has_many :double_classes, :dependent => :destroy
  has_many :study_groups, :dependent => :destroy
end