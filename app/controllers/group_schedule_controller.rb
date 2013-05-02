class GroupScheduleController < ApplicationController

  def index
    @study_group = StudyGroup.find(params[:study_group_id])
    @schedule = [@study_group.double_classes.map(&:schedules)].flatten!
  end
end
