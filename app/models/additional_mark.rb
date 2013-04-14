class AdditionalMark < Mark
  attr_accessible :study_description, :study_number, :study_type_id, :double_class_id

  belongs_to :study_type
  belongs_to :double_class

  validates :study_type, :student, :double_class, :date, :mark, :scores, :presence => true
  validates :study_number, :numericality => { :only_integer => true } unless study_number.blank?
end
