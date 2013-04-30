class StudentController < ApplicationController

  def show
    @semester = Semester.find_by_id(params[:semester_id])
    @study_group = @semester.study_groups.find_by_id(params[:group_id])
    @student_in_group = @study_group.students_in_groups.find_by_id(params[:id])
  end
end
