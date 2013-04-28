class Api::V1::SearchStudentController < ApplicationController
  respond_to :json, :xml
  
  def index
    if params[:first_name] or params[:last_name] or params[:patronymic] or params[:all_fields]
      @order = (!params[:order].nil? && params[:order].upcase) == "ASC" ? "ASC" : "DESC"
      @students = Student.order("created_at #{@order}").find(:all, :conditions => conditions)
      respond_with(@students.map(&:to_hash))
    else
      respond_with([])
    end
  end
  
  private
  
  def first_name_conditions
    unless params[:first_name].blank?
      ["first_name LIKE ?", "%#{params[:first_name].gsub(/['%_;]/, '')}%"]
    end
  end

  def last_name_conditions
    unless params[:last_name].blank?
      ["last_name LIKE ?", "%#{params[:last_name].gsub(/['%_;]/, '')}%"]
    end
  end
  
  def patronymic_conditions
    if not params[:patronymic].blank?
      ["patronymic LIKE ?", "%#{params[:patronymic].gsub(/['%_;]/, '')}%"]
    end
  end
  
  def all_fields_conditions
    unless params[:all_fields].blank?
      all_fields = params[:all_fields].gsub(/['%_;]/, '')
      ["first_name LIKE ? AND last_name LIKE ? AND patronymic LIKE ?",
       "%#{all_fields}%", "%#{all_fields}%", "%#{all_fields}%"]
    end
  end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end
  
  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end
  
  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end
  
  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end
end
