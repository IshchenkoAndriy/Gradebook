class AdditionalMark < Mark
  attr_accessible :study_description, :study_number, :study_type_id, :double_class_id

  belongs_to :study_type
  belongs_to :double_class

  validates :study_type, :double_class, :presence => true
  validates :study_number, :numericality => { :only_integer => true }, :unless => Proc.new { |mark| mark.study_number.blank? }
end
