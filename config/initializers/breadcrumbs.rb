# Remember to restart your application after editing this file.

Gretel::Crumbs.layout do
  # User crumbs
  crumb :semesters do
    link I18n.t("active_admin.semester.menu"), semesters_path
  end

  crumb :semester_study_groups do |semester|
    link semester.name, semester_groups_path(semester)
    parent :semesters
  end

  crumb :study_group_students do |study_group|
    link study_group.group.name, semester_group_students_path(study_group.semester, study_group)
    parent :semester_study_groups, study_group.semester
  end

  crumb :student do |student_in_group|
    link student_in_group.student.full_name, '#'
    parent :study_group_students, student_in_group.study_group
  end

  crumb :schedule do |study_group|
    link '%s %s' % [study_group.group.name, I18n.t('active_admin.schedule.title_index')], '#'
    parent :semester_study_groups, study_group.semester
  end

  crumb :semester_teachers do |semester|
    link 'Teacher list', semester_teacher_index_path(semester)
    parent :semester_study_groups, semester
  end

  crumb :curator do |semester, teacher|
    link teacher.full_name, '#'
    parent :semester_teachers, semester
  end

  # Teacher crumbs
  crumb :teacher_semesters do
    link I18n.t("active_admin.semester.menu"), teacher_semesters_path
  end

  crumb :double_classes do |semester|
    link semester.name, teacher_semester_double_classes_path(semester)
    parent :teacher_semesters
  end

  crumb :lessons do |double_class|
    link double_class.title + ' Lessons', double_class_lessons_path(double_class)
    parent :double_classes, double_class.study_group.semester
  end

  crumb :lesson_marks do |lesson|
    link 'Marks', lesson_lesson_mark_index_path(lesson)
    parent :lessons, lesson.double_class
  end

  crumb :presences do |lesson|
    link 'Presences', lesson_presence_index_path(lesson)
    parent :lessons, lesson.double_class
  end

  crumb :additional_marks do |double_class|
    link double_class.title + ' Additional marks', double_class_additional_mark_index_path(double_class)
    parent :double_classes, double_class.study_group.semester
  end
end