class Api::V1::SearchGroupController < ApplicationController
  respond_to :json, :xml
  
  def index
    if params[:name]
      @order = (!params[:order].nil? && params[:order].upcase) == "ASC" ? "ASC" : "DESC"

      group_name =  params[:name].gsub(/[%_;]/, '')
      @groups = Group.order("created_at #{@order}").find(:all, :conditions=> ["name like ?", "%" + group_name + "%"])
      respond_with(@groups.map(&:with_semesters_to_hash))
    else
      respond_with([])
    end
  end
end