class LessonMarkController < ApplicationController
  load_and_authorize_resource :lesson

  def index
    @lesson = Lesson.find(params[:lesson_id])
    authorize! :read, @lesson
    @lesson_marks = @lesson.lesson_marks
  end

  def show
    @lesson_mark = LessonMark.find(params[:id])
  end

  def new
    @new_lesson_mark = Lesson.find(params[:lesson_id]).lesson_marks.new
  end

  def create
    @new_lesson_mark = Lesson.find(params[:lesson_id]).lesson_marks.new(params[:lesson_mark])
    authorize! :create, @new_lesson_mark

    if @new_lesson_mark.save
      redirect_to :back, notice: t('mark_success_created')
    else
      redirect_to :back, alert: @new_lesson_mark.errors.full_messages.join(', ')
    end
  end

  def edit
    @lesson_mark = LessonMark.find(params[:id])
  end

  def update
    @lesson_mark = LessonMark.find(params[:id])
    authorize! :update, @lesson_mark

    if @lesson_mark.update_attributes(params[:lesson_mark])
      redirect_to :back, notice: t('mark_success_updated')
    else
      redirect_to :back, alert: @lesson_mark.errors.full_messages.join(', ')
    end
  end

  def destroy
    @lesson_mark = LessonMark.find(params[:id])
    authorize! :destroy, @lesson_mark
    @lesson_mark.destroy

    redirect_to :back, notice: t('mark_success_destroyed')
  end

end
