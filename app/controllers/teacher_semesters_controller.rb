class TeacherSemestersController < ApplicationController
  load_and_authorize_resource :semester

  def index
    logger.debug "Teacher id: #{current_user.teacher_id}"
    @semesters = Teacher.find(current_user.teacher_id).teacher_semesters
  end
end
