class PresenceController < ApplicationController
  load_and_authorize_resource :lesson

  def index
    @lesson = Lesson.find(params[:lesson_id])
    authorize! :read, @lesson
    @presences = @lesson.presences
  end

  def new
    @presence = Lesson.find(params[:lesson_id]).presences.new(:student_id => params[:student_id])
    authorize! :create, @presence

    respond_to do |format|
      format.js
    end
  end

  def create
    @presence = Lesson.find(params[:lesson_id]).presences.new(params[:presence])
    authorize! :create, @presence

    if @presence.save
      redirect_to :back, notice: t('presence_success_created')
    else
      redirect_to :back, alert: @presence.errors.full_messages.join(', ')
    end
  end

  def edit
    @presence = Presence.find(params[:id])
    authorize! :update, @presence

    respond_to do |format|
      format.js
    end
  end

  def update
    @presence = Presence.find(params[:id])
    authorize! :update, @presence

    if @presence.update_attributes(params[:presence])
      redirect_to :back, notice: t('presence_success_updated')
    else
      redirect_to :back, alert: @presence.errors.full_messages.join(', ')
    end
  end

  def destroy
    @presence = Presence.find(params[:id])
    authorize! :destroy, @presence
    @presence.destroy

    redirect_to :back, notice: t('presence_success_destroyed')
  end
end
