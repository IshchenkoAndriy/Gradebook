class AdditionalMarkController < ApplicationController

  def index
    logger.debug "Teacher id: #{current_user.teacher_id}"

    @double_class = DoubleClass.find(params[:double_class_id])
    authorize! :read, @double_class
    @additional_marks = @double_class.additional_marks.all
  end

  def create
    @double_class = DoubleClass.find(params[:double_class_id])
    @additional_mark = @double_class.additional_marks.new(params[:additional_mark])
    authorize! :read, @double_class

    if @additional_mark.save
      redirect_to :back, notice: 'Additional successful saved'
    else
      redirect_to :back, alert: @additional_mark.errors.full_messages.to_s
    end
  end

  def update
    @additional_mark = AdditionalMark.find(params[:id])
    authorize! :update, @additional_mark

    if @additional_mark.update_attributes(params[:additional_mark])
      redirect_to :back, notice: 'Additional mark  successful updated'
    else
      redirect_to :back, alert: @additional_mark.errors.full_messages.join(', ')
    end
  end

  def destroy
    @additional_mark = AdditionalMark.find(params[:id])
    authorize! :destroy, @additional_mark
    @additional_mark.destroy

    redirect_to :back, notice: 'Additional mark successful deleted'
  end
end
