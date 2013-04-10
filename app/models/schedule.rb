class Schedule < ActiveRecord::Base
  attr_accessible :day_of_week, :double_class_number, :numerator_denominator, :subgroup

  belongs_to :double_class

  validates :day_of_week, :double_class_number, :numerator_denominator, :subgroup, :presence => true

  validates :day_of_week, :numericality => {
      :only_integer => true,
      :greater_than_or_equal_to => 1,
      :less_than_or_equal_to => 7
  }

  validates :double_class_number, :numericality => {
      :only_integer => true,
      :greater_than_or_equal_to => 1,
      :less_than_or_equal_to => 6
  }

  validates :numerator_denominator, :subgroup, :numericality => {
      :only_integer => true,
      :greater_than_or_equal_to => 1,
      :less_than_or_equal_to => 3
  }

  def to_hash
    [
      :day_of_week => self.day_of_week,
      :double_class_number => self.double_class_number,
      :numerator_denominator => self.numerator_denominator,
      :subgroup => self.subgroup
    ]
  end

  def to_s
    "%s %s" % [self.double_class.subject.name, self.double_class.teacher.first_name]
  end

end
