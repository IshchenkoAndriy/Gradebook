class Api::V1::SubjectsController < ApplicationController
  respond_to :json, :xml
  
  def index
    @student_in_group = StudentsInGroup.joins(:study_group).where(
        :study_groups => {semester_id: params[:semester_id], group_id: params[:group_id]},
        student_id: params[:student_id]
    ).first
    @subjects = Subject.joins(:double_classes).where(:double_classes => {:study_group_id => @student_in_group.study_group_id}).uniq

    @subjects_marks = []
    @subjects.each do |subject|
      @subjects_marks << {
          :id => subject.id,
          :subject => subject.name,
          :modules => @student_in_group.study_info(subject)
      }
    end
    respond_with @subjects_marks
  end
  
  def show
    @student_in_group = StudentsInGroup.joins(:study_group).where(
        :study_groups => {semester_id: params[:semester_id], group_id: params[:group_id]},
        student_id: params[:student_id]
    ).first
    @selected_subject = Subject.find(params[:id]) unless params[:id].blank?

    unless @selected_subject.nil?
      @subject_marks = {
          :id => @selected_subject.id,
          :subject => @selected_subject.name,
          :modules => @student_in_group.study_info(@selected_subject),
          :double_classes => @selected_subject.all_lessons_info(@student_in_group)
      }
    end
    respond_with @subject_marks
  end
end