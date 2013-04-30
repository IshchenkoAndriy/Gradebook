class TeacherController < ApplicationController

  def index
    @semester = Semester.find(params[:semester_id])
    @teachers = Teacher.joins(:double_classes => :study_group).where(:study_groups => { :semester_id => Semester.first.id }).uniq
  end

  def show
    @semester = Semester.find(params[:semester_id])
    @teacher = Teacher.find_by_id(params[:id])
    @double_classes = DoubleClass.joins(:study_group).where(:teacher_id => @teacher.id,
                                                      :study_groups => {:semester_id => @semester.id})
    @schedule = [@double_classes.map(&:schedules)].flatten!
  end
end
