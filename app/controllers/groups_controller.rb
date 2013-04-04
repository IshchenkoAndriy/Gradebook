class GroupsController < ApplicationController
  
  def index
    @semester = Semester.find(params[:semester_id])
    @groups = @semester.study_groups
    
    @navigation = [
      {name: I18n.t("active_admin.semester.menu"), url: url_for( semesters_path )},
      {name: @semester.name, url: nil}
    ]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end
  
end
