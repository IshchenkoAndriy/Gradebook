class GroupsController < ApplicationController
  
  def index
    @recent_semesters = Semester.recent_semesters
    @semester = Semester.find(params[:semester_id])
    @groups = @semester.study_groups
  end
end
