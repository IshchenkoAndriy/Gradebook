class Student < Person
  attr_accessible :relationships_attributes

  has_many :students_in_groups, :dependent => :destroy
  has_many :study_groups, :through => :students_in_groups
  has_many :marks, :dependent => :destroy
  has_many :presences, :dependent => :destroy
  has_many :relationships
  has_many :parents, :through => :relationships

  accepts_nested_attributes_for :relationships, :allow_destroy => true

  def self.absent(date)
    Student.joins(:presences => :lesson).where(
      :presences => {
        :was_present => false,
        :lesson => {
            :date => date.to_date
        }
      }
    )
  end
end