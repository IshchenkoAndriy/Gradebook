class VisualEditorController < ApplicationController

  def index
    @double_class = DoubleClass.find(params[:double_class_id])
    authorize! :read, @double_class
    @lessons = @double_class.lessons.order('created_at ASC').all
    render :layout => 'full_screen'
  end
end
