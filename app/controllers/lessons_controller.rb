class LessonsController < ApplicationController
  load_and_authorize_resource :double_class, :only => [:index, :create]
  load_and_authorize_resource :lesson, :only => [:update, :destroy]

  def index
    @double_class = DoubleClass.find(params[:double_class_id])
    authorize! :read, @double_class
    @lessons = @double_class.lessons.all
  end

  def new
    @lesson = DoubleClass.find(params[:double_class_id]).lessons.new
    authorize! :create, @lesson

    respond_to do |format|
      format.js
    end
  end

  def create
    @lesson = DoubleClass.find(params[:double_class_id]).lessons.new(params[:lesson])
    authorize! :create, @lesson

    if @lesson.save
      redirect_to :back, notice: t('lesson_success_created')
    else
      redirect_to :back, alert: @lesson.errors.full_messages.to_s
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    authorize! :update, @lesson

    respond_to do |format|
      format.js
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    authorize! :update, @lesson

    if @lesson.update_attributes(params[:lesson])
      redirect_to :back, notice: t('lesson_success_updated')
    else
      redirect_to :back, alert: @lesson.errors.full_messages.join(', ')
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    authorize! :destroy, @lesson
    @lesson.destroy

    redirect_to :back, notice: t('lesson_success_destroyed')
  end
end
