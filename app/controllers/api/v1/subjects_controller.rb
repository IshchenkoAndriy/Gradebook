class Api::V1::SubjectsController < ApplicationController
  respond_to :json, :xml
  
  def index
    if not params[:group_id].blank?
      @subjects = Subject.joins(:double_classes => :study_group).where(
        :study_groups => {semester_id: params[:semester_id], group_id: params[:group_id]}).uniq
      respond_with(@subjects.map(&:to_hash))
    else
      respond_with([])
    end
  end
  
  def show
    if params[:student_id].blank?
      @subject = Subject.find_by_id(params[:id])
      @double_classes = DoubleClass.joins(:study_group).where(
            :study_groups => {semester_id: params[:semester_id], group_id: params[:group_id]}, 
            :double_classes => {subject_id: params[:id]})
      respond_with(@subject.nil? ? nil : @subject.to_hash.merge({ :double_classes => @double_classes.map(&:to_hash) }))
    else
      @subject = Subject.find_by_id(params[:id])
      @marks_n_presences = Array.new
      @double_classes = DoubleClass.joins(:study_group).where(
            :study_groups => {semester_id: params[:semester_id], group_id: params[:group_id]}, 
            :double_classes => {subject_id: params[:id]})
      @double_classes.each do |double_class|
        @marks = double_class.marks.where(student_id: params[:student_id])
        @presences = double_class.presences.where(student_id: params[:student_id])
        @marks_n_presences << double_class.to_hash.merge(:marks => @marks, :presences => @presences)
      end
      respond_with(@subject.nil? ? nil : @subject.to_hash.merge({ :double_classes => @marks_n_presences }))
    end
  end
end