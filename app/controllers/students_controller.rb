class StudentsController < ApplicationController
  
  def index
    @study_group = StudyGroup.find(params[:study_group_id])
    @choosed_double_class = @study_group.double_classes.find_by_id(params[:double_class_id]) if (params[:double_class_id])
  end

  def show
    @student_in_group = StudentsInGroup.where(study_group_id: params[:study_group_id], student_id: params[:id]).first
    @subjects = Subject.joins(:double_classes).where(:double_classes => {:study_group_id => params[:study_group_id]}).uniq

    @module_mark = []

    if params[:subject_id].blank?
      @subjects.each do |subject|
        subject_marks = {}
        (1..NUMBER_OF_MODULES).to_a.each do |study_module|
          presence_mark = get_presence_module_mark(subject.id, params[:study_group_id], params[:id], study_module)
          lesson_mark = get_lesson_module_mark(subject.id, params[:study_group_id], params[:id], study_module)
          additional_mark = get_additional_module_mark(subject.id, params[:study_group_id], params[:id], study_module)
          subject_marks.merge!({
            study_module => {
                :presence_mark => presence_mark,
                :lesson_mark => lesson_mark,
                :additional_mark => additional_mark
              }
            }
          )
        end
        @module_mark << subject_marks
      end
    else
      @choosed_subject = Subject.find(params[:subject_id])

      subject_marks = {}
      (1..NUMBER_OF_MODULES).to_a.each do |study_module|
        presence_mark = get_presence_module_mark(@choosed_subject.id, params[:study_group_id], params[:id], study_module)
        lesson_mark = get_lesson_module_mark(@choosed_subject.id, params[:study_group_id], params[:id], study_module)
        additional_mark = get_additional_module_mark(@choosed_subject.id, params[:study_group_id], params[:id], study_module)
        subject_marks.merge!({
            study_module => {
              :presence_mark => presence_mark,
              :lesson_mark => lesson_mark,
              :additional_mark => additional_mark
            }
          }
        )
      end
      @module_mark << subject_marks

      @double_classes_info = []
      DoubleClass.where(subject_id: @choosed_subject.id, study_group_id: params[:study_group_id]).each do |double_class|
        presence = Presence.joins(:lesson).where(
            :lessons => {:double_class_id => double_class.id},
            :student_id => params[:id],
            :was_present => true
        ).count

        total_presence = Presence.joins(:lesson).where(
            :lessons => {:double_class_id => double_class.id},
            :student_id => params[:id]
        ).count

        lessons_marks = []
        double_class.lessons.each do |lesson|
          lessons_mark = lesson.lesson_marks.where(student_id: params[:id]).first
          if lessons_mark.nil?
            lessons_marks << {
                :lessons_name => '%s %s' % [double_class.double_class_type.name, lesson.description],
                :score => nil
            }
          else
            lessons_marks << {
              :lessons_name => '%s %s' % [double_class.double_class_type.name, lesson.description],
              :score => lessons_mark.score
            }
          end
        end
        double_class_info = { :lessons => lessons_marks }
        double_class_info.merge!({:presence => presence.to_f / total_presence.to_f}) unless total_presence == 0
        @double_classes_info << double_class_info
      end
    end
  end

  private

  def get_presence_module_mark(subject_id, study_group_id, student_id, study_module)
  #  double_class has different presence mark
    sum = 0
    DoubleClass.where(subject_id: subject_id, study_group_id: study_group_id).each do |double_class|
      total_presence_mark = Presence.joins(:lesson).where(
          :lessons => {:double_class_id => double_class.id},
          :student_id => student_id,
          :was_present => true,
          :module => study_module
      ).count
      sum = sum + total_presence_mark * double_class.presence_score
    end
    sum
  end

  def get_lesson_module_mark(subject_id, study_group_id, student_id, study_module)
    LessonMark.joins(:lesson => :double_class).where(
        :lessons => {:double_classes => {
            :subject_id => subject_id,
            :study_group_id => study_group_id
        }},
        :student_id => student_id,
        :module => study_module
    ).sum(:score)
  end

  def get_additional_module_mark(subject_id, study_group_id, student_id, study_module)
    AdditionalMark.joins(:double_class).where(
        :double_classes => {
            :subject_id => subject_id,
            :study_group_id => study_group_id
        },
        :student_id => student_id,
        :module => study_module
    ).sum(:score)
  end

end
