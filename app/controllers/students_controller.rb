class StudentsController < ApplicationController
  
  def index
    @study_group = StudyGroup.find(params[:study_group_id])
    @selected_double_class = @study_group.double_classes.find_by_id(params[:double_class_id]) if (params[:double_class_id])
  end

  def show
    @student_in_group = StudentsInGroup.where(study_group_id: params[:study_group_id], student_id: params[:id]).first
    @subjects = Subject.joins(:double_classes).where(:double_classes => {:study_group_id => params[:study_group_id]}).uniq
    @choosed_subject = Subject.find(params[:subject_id]) unless params[:subject_id].blank?

    @module_mark = []
    if @choosed_subject.nil?
      @subjects.each do |subject|
        @module_mark << @student_in_group.study_info(subject)
      end
    else
      @module_mark << @student_in_group.study_info(@choosed_subject)
      @double_classes_info = @choosed_subject.all_lessons_info(@student_in_group)
    end
  end
end
