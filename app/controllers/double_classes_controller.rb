class DoubleClassesController < ApplicationController

  def index
    @current_semester = Semester.find_by_id(params[:teacher_semester_id])
    authorize! :read, @current_semester
    @teacher_semesters = Teacher.find(current_user.teacher_id).teacher_semesters
    @double_classes = DoubleClass.joins(:study_group).where(:teacher_id => current_user.teacher_id,
                                                            :study_groups => { :semester_id => @current_semester.id })
  end
end
