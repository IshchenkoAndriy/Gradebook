class AdditionalMark < Mark
  attr_accessible :study_description, :study_number, :study_type_id, :double_class_id

  belongs_to :study_type
  belongs_to :double_class

  validates :study_type, :double_class, :presence => true
  validates :study_number, :numericality => { :only_integer => true }, :unless => Proc.new { |mark| mark.study_number.blank? }

  def self.get_score(subject_id, study_group_id, student_id, study_module)
    AdditionalMark.joins(:double_class).where(
        :double_classes => {
            :subject_id => subject_id,
            :study_group_id => study_group_id
        },
        :student_id => student_id,
        :module => study_module
    ).sum(:score)
  end
end
