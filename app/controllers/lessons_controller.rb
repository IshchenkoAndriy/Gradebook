class LessonsController < ApplicationController
  load_and_authorize_resource :double_class, :only => [:index, :create]
  load_and_authorize_resource :lesson, :only => [:update, :destroy]

  def index
    logger.debug "Teacher id: #{current_user.teacher_id}"

    @double_class = DoubleClass.find(params[:double_class_id])
    authorize! :read, @double_class
    @lessons = @double_class.lessons.all

    @navigation = [
        {name: I18n.t("active_admin.semester.menu"), url: teacher_semesters_path},
        {name: @double_class.study_group.semester.name, url: teacher_semester_double_classes_path(@double_class.study_group.semester)},
        {name: @double_class.name, url: nil},
    ]
  end

  def create
    @double_class = DoubleClass.find(params[:double_class_id])
    @lesson = @double_class.lessons.new(params[:lesson])
    authorize! :read, @double_class

    if @lesson.save
      redirect_to :back, notice: 'Lesson successful saved'
    else
      redirect_to :back, alert: @lesson.errors.full_messages.to_s
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    authorize! :update, @lesson

    if @lesson.update_attributes(params[:lesson])
      redirect_to :back, notice: 'Lesson  successful updated'
    else
      redirect_to :back, alert: @lesson.errors.full_messages.join(', ')
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    authorize! :destroy, @lesson
    @lesson.destroy

    redirect_to :back, notice: 'Lesson  successful deleted'
  end
end
