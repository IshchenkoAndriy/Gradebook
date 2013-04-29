class TeacherSemestersController < ApplicationController
  load_and_authorize_resource :semester

  def index
    logger.debug "Teacher id: #{current_user.teacher_id}"
    @semesters = Semester.joins(:study_groups => :double_classes).where(:double_classes => {:teacher_id => current_user.teacher_id }).uniq

    @navigation = [
        {name: I18n.t("active_admin.semester.menu"), url: nil}
    ]

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @semesters }
    end
  end
end
