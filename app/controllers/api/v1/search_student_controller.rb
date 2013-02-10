class Api::V1::SearchStudentController < ApplicationController
  respond_to :json, :xml
  
  def index
    if params[:first_name] or params[:second_name] or params[:patronymic] or params[:all_fields]
      @order = (!params[:order].nil? && params[:order].upcase) == "ASC" ? "ASC" : "DESC"
      @students = Student.order("created_at #{@order}").find(:all, :conditions => conditions)
      respond_with(@students.map(&:to_hash))
    else
      respond_with([])
    end
  end
  
  private
  
  def first_name_conditions
    if not params[:first_name].blank?
      ["first_name LIKE ?", "%#{params[:first_name].gsub(/['%_;]/, '')}%"]
    end
  end

  def second_name_conditions
    if not params[:second_name].blank?
      ["second_name LIKE ?", "%#{params[:second_name].gsub(/['%_;]/, '')}%"]
    end
  end
  
  def patronymic_conditions
    if not params[:patronymic].blank?
      ["patronymic LIKE ?", "%#{params[:patronymic].gsub(/['%_;]/, '')}%"]
    end
  end
  
  def all_fields_conditions
    if not params[:all_fields].blank?
      all_fields = params[:all_fields].gsub(/['%_;]/, '')
      ["first_name LIKE ? AND second_name LIKE ? AND patronymic LIKE ?", 
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
