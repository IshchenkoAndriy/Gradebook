class Api::V1::StudentsController < ApplicationController
  respond_to :json, :xml
  
  def index
    @order = (!params[:order].nil? && params[:order].upcase) == "ASC" ? "ASC" : "DESC"
    if params[:semester_id].to_i != 0 and params[:group_id].to_i != 0
      @study_group = StudyGroup.where(semester_id: params[:semester_id].to_i, group_id: params[:group_id].to_i).last
      if @study_group
        @students = StudentsInGroup.order("created_at #{@order}").where(study_group_id: @study_group.id).map(&:student)
        respond_with(@students.map(&:to_hash))
      else
        respond_with([])
      end
    else
      respond_with([])
    end
  end
  
  def show
    @student = Student.find_by_id(params[:id])
    if @student.nil?
      respond_with(@student)
    else
      @semesters = Array.new
      @student.study_groups.each do |study_group|
        @semesters << Hash[:semester => study_group.semester.to_hash, :curator => study_group.teacher.to_hash, :group =>  study_group.group.to_hash]
      end
      respond_with(@student.to_hash.merge({:semesters => @semesters}))
    end
  end
end