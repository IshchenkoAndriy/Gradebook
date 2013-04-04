class StudentsController < ApplicationController
  
  def index
    @semester = Semester.find(params[:semester_id])
    @group = StudyGroup.find(params[:group_id])
    @students = StudentsInGroup.where(study_group_id: params[:group_id])
    
    @navigation = [
      {name: I18n.t("active_admin.semester.menu"), url: url_for( semesters_path )},
      {name: @semester.name, url: url_for( semester_groups_path(@semester) )},
      {name: @group.name, url: nil}
    ]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end
  
end
