class StudentsController < ApplicationController
  
  def index
    @study_group = StudyGroup.find(params[:study_group_id])
    @choosed_double_class = @study_group.double_classes.find_by_id(params[:double_class_id]) if (params[:double_class_id])
  end

  def show
    @student_in_group = StudentsInGroup.where(study_group_id: params[:study_group_id], student_id: params[:id]).first
  end
end
