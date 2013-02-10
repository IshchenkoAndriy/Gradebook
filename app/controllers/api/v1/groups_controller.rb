class Api::V1::GroupsController < ApplicationController
  respond_to :json, :xml
  
  def index
    if (not params[:all].nil?) && params[:all] == "true"
      @order = (!params[:order].nil? && params[:order].upcase) == "ASC" ? "ASC" : "DESC"
      if params[:semester_id].to_i != 0
        @groups = StudyGroup.order("created_at #{@order}").where(semester_id: params[:semester_id].to_i).map(&:group)
      else
        @groups = Group.order("created_at #{@order}").all
      end
      respond_with(@groups.map(&:with_semesters_to_hash))
    else
      @offset = params[:offset].nil? ? 0 : params[:offset].to_i
      @limit = params[:limit].nil? ? 30 : params[:limit].to_i
      @order = (!params[:order].nil? && params[:order].upcase) == "ASC" ? "ASC" : "DESC"
      if params[:semester_id].to_i != 0
        @groups = StudyGroup.limit(@limit).offset(@offset).order("created_at #{@order}").where(semester_id: params[:semester_id].to_i).map(&:group)
      else
        @groups = Group.limit(@limit).offset(@offset).order("created_at #{@order}")
      end
      respond_with(@groups.map(&:with_semesters_to_hash))
    end
  end
  
  def show
    @group = Group.find_by_id(params[:id])
    respond_with(@group.nil? ? nil : @group.with_semesters_to_hash)
  end
end