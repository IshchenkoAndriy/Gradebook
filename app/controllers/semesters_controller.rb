class SemestersController < ApplicationController
  
  def index
    @semesters = Semester.order('created_at DESC').all
  end
end
