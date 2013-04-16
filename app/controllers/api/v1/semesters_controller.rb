class Api::V1::SemestersController < ApplicationController
  respond_to :json, :xml
  
  def index
    if (not params[:all].nil?) && params[:all] == "true"
      @order = (!params[:order].nil? && params[:order].upcase) == "ASC" ? "ASC" : "DESC"
      @semesters = Semester.order("created_at #{@order}").all
      respond_with(@semesters.map(&:to_hash))
    else
      @offset = params[:offset].nil? ? 0 : params[:offset].to_i
      @limit = params[:limit].nil? ? 30 : params[:limit].to_i
      @order = (!params[:order].nil? && params[:order].upcase) == "ASC" ? "ASC" : "DESC"
      @semesters = Semester.limit(@limit).offset(@offset).order("created_at #{@order}")
      respond_with(@semesters.map(&:to_hash))
    end
  end
  
  def show
    @semester = Semester.find_by_id(params[:id])
    respond_with(@semester.nil? ? nil : @semester.to_hash)
  end
end