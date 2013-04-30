class GroupScheduleController < ApplicationController

  def index
    @semester = Semester.find(params[:semester_id])
    @study_group = @semester.study_groups.find_by_id(params[:group_id])
    @schedule = [@study_group.double_classes.map(&:schedules)].flatten!
  end
end
