class StudyGroup < ActiveRecord::Base
  attr_accessible :semester_id, :group_id, :teacher_id, :students_in_groups_attributes
  
  belongs_to :semester
  belongs_to :group
  belongs_to :teacher
  
  has_many :students_in_groups, :dependent => :destroy
  has_many :students, :through => :students_in_groups
  has_many :double_classes, :dependent => :destroy

  accepts_nested_attributes_for :students_in_groups, :allow_destroy => true
  
  validates :semester, :group, :teacher, :presence => true
  
  def name
    self.group.name
  end

  def all_students
    self.students.order('last_name ASC').all
  end

  def all_students_in_group
    StudentsInGroup.joins(:student).where(:study_group_id => self.id).order('subgroup ASC, people.last_name ASC')
  end

  def import_students
    study_group = self
    unless study_group.students_in_groups.any?
      previous = StudyGroup.where{(group_id == study_group.group_id) & (id != study_group.id)}.last
      if previous
        previous.students_in_groups.each do |student_in_group|
          self.students_in_groups.new(student_id: student_in_group.student_id, subgroup: student_in_group.subgroup)
        end
      end
    end
  end
end
