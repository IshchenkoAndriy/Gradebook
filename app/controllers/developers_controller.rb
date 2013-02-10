class Api::V1::DevelopersController < ApplicationController
  def index
    @topics = ['basic', 'architecture', 'semesters', 'groups', 'students', 'subjects']
    @version = 'v1'
  end
end
