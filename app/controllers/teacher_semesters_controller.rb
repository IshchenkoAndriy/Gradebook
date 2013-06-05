class TeacherSemestersController < ApplicationController

  def index
    authorize! :read, Semester
    @semesters = Teacher.find(current_user.teacher_id).teacher_semesters
  end
end
