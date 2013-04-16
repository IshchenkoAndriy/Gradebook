class StudentsController < ApplicationController
  
  def index
    @semester = Semester.find_by_id(params[:semester_id])
    @study_group = @semester.study_groups.find_by_id(params[:group_id])
    @students_in_group = @study_group.students_in_groups.all
    @group_double_classes = @study_group.double_classes
    @choosed_double_class = @study_group.double_classes.find_by_id(params[:double_class_id]) if (params[:double_class_id])

    @navigation = [
      {name: I18n.t("active_admin.semester.menu"), url: url_for( semesters_path )},
      {name: @semester.name, url: url_for( semester_groups_path(@semester) )},
      {name: @study_group.group.name, url: nil}
    ]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end
  
end
