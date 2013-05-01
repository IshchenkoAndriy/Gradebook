class VisualEditorController < ApplicationController

  def index
    @double_class = DoubleClass.find(params[:double_class_id])
    authorize! :read, @double_class
    @lessons = @double_class.lessons.all
  end
end
