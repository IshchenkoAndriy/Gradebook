class Schedule < ActiveRecord::Base
  attr_accessible :day_of_week, :double_class_number, :numerator_denominator, :subgroup

  belongs_to :double_class

  validates :double_class, :day_of_week, :double_class_number, :numerator_denominator, :subgroup, :presence => true

  def to_hash
    [
      :day_of_week => self.day_of_week,
      :double_class_number => self.double_class_number,
      :numerator_denominator => self.numerator_denominator,
      :subgroup => self.subgroup
    ]
  end
end
