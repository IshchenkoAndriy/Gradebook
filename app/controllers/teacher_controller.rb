class TeacherController < ApplicationController

  def index
    @semester = Semester.find(params[:semester_id])
    @teachers = Teacher.joins(:double_classes => :study_group).where(:study_groups => { :semester_id => Semester.first.id }).uniq

    @navigation = [
        {name: I18n.t("active_admin.semester.menu"), url: url_for( semesters_path )},
        {name: @semester.name, url: url_for( semester_groups_path(@semester) )},
        {name: 'Teacher list', url: nil}
    ]

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @teachers }
    end
  end

  def show
    @semester = Semester.find(params[:semester_id])
    @teacher = Teacher.find_by_id(params[:id])
    @double_classes = DoubleClass.joins(:study_group).where(:teacher_id => @teacher.id,
                                                            :study_groups => {:semester_id => @semester.id})
    @schedule = [@double_classes.map(&:schedules)].flatten!

    @navigation = [
        {name: I18n.t("active_admin.semester.menu"), url: url_for( semesters_path )},
        {name: @semester.name, url: url_for( semester_groups_path(@semester) )},
        {name: @teacher.name, url: nil}
    ]

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @double_classes }
    end
  end

end
