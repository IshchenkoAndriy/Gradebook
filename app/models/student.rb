class Student < Person
  has_many :students_in_groups, :dependent => :destroy
  has_many :study_groups, :through => :students_in_groups
  has_many :marks, :dependent => :destroy
  has_many :presences, :dependent => :destroy
  has_many :relationships
  has_many :parents, :through => :relationships

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