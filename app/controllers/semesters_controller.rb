class SemestersController < ApplicationController
  
  def index
    @navigation = [{name: I18n.t("active_admin.semester.menu"), url: nil}]
    @semesters = Semester.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @semesters }
    end
  end
  
end
