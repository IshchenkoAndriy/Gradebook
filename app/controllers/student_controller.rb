class StudentController < ApplicationController

  def show
    @semester = Semester.find_by_id(params[:semester_id])
    @study_group = @semester.study_groups.find_by_id(params[:group_id])
    @student_in_group = @study_group.students_in_groups.find_by_id(params[:id])

    @navigation = [
        {name: I18n.t("active_admin.semester.menu"), url: url_for( semesters_path )},
        {name: @semester.name, url: url_for( semester_groups_path(@semester) )},
        {name: @study_group.group.name, url: url_for( semester_group_students_path(@semester, @study_group) )},
        {name: @student_in_group.student.name, url: nil}
    ]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

end
