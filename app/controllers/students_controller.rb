class StudentsController < ApplicationController
  
  def index
    @semester = Semester.find_by_id(params[:semester_id])
    @recent_semesters = Semester.recent_semesters
    @study_group = @semester.study_groups.find_by_id(params[:group_id])
    @students_in_group = @study_group.students_in_groups.all
    @group_double_classes = @study_group.double_classes
    @choosed_double_class = @study_group.double_classes.find_by_id(params[:double_class_id]) if (params[:double_class_id])
  end
end
