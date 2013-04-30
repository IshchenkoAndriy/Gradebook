class Teacher < Person
  has_many :double_classes, :dependent => :destroy
  has_many :study_groups, :dependent => :destroy

  def teacher_semesters
    Semester.joins(:study_groups => :double_classes).where(:double_classes => {:teacher_id => self.id }).order('created_at DESC').uniq
  end

  def last_teacher_semester
    Semester.joins(:study_groups => :double_classes).where(:double_classes => {:teacher_id => self.id }).last
  end

end