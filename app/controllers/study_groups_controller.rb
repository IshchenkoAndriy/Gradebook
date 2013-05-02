class StudyGroupsController < ApplicationController
  
  def index
    @semester = Semester.find(params[:semester_id])
    @groups = @semester.study_groups
  end
end
