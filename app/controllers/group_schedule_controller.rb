class GroupScheduleController < ApplicationController

  def index
    @semester = Semester.find(params[:semester_id])
    @study_group = @semester.study_groups.find_by_id(params[:group_id])
    @schedule = []
    @schedule = @study_group.double_classes.map(&:schedules).flatten! unless @study_group.nil?

    @navigation = [
        {name: I18n.t('active_admin.semester.menu'), url: url_for( semesters_path )},
        {name: @semester.name, url: url_for( semester_groups_path(@semester) )},
        {name: '%s %s' % [@study_group.group.name, I18n.t('active_admin.schedule.title_index')], url: nil}
    ]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedule }
    end
  end

end
