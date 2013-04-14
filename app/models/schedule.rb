class ScheduleValidator < ActiveModel::Validator
  def validate(new_schedule)
    study_group_id = new_schedule.double_class.study_group_id
    group_schedules = Schedule.joins(:double_class).where{
      (day_of_week.eq new_schedule.day_of_week) &
      (double_class_number.eq new_schedule.double_class_number) &
      (double_classes.study_group_id.eq study_group_id) &
      (double_classes.id.not_eq new_schedule.double_class_id)
    }

    new_schedule.invalid_schedule?(group_schedules, I18n.t('active_admin.schedule.schedule_exist_for_group')) unless group_schedules.nil?

    teacher_schedules = Schedule.joins(:double_class => :study_group).where{
      (day_of_week.eq new_schedule.day_of_week) &
      (double_class_number.eq new_schedule.double_class_number) &
      (double_classes.id.not_eq new_schedule.double_class_id) &
      (double_classes.teacher_id.eq new_schedule.double_class.teacher_id) &
      (double_classes.study_groups.semester_id.eq new_schedule.double_class.study_group.semester_id)
    }

    new_schedule.invalid_schedule?(teacher_schedules, I18n.t('active_admin.schedule.schedule_exist_for_teacher')) unless teacher_schedules.nil?
  end
end

class Schedule < ActiveRecord::Base
  attr_accessible :day_of_week, :double_class_number, :numerator_denominator, :subgroup

  belongs_to :double_class

  validates :day_of_week, :double_class_number, :numerator_denominator, :subgroup, :presence => true

  validates :day_of_week, :numericality => {
      :only_integer => true,
      :greater_than_or_equal_to => 1,
      :less_than_or_equal_to => 7
  }

  validates :double_class_number, :numericality => {
      :only_integer => true,
      :greater_than_or_equal_to => 1,
      :less_than_or_equal_to => 6
  }

  validates :numerator_denominator, :subgroup, :numericality => {
      :only_integer => true,
      :greater_than_or_equal_to => 1,
      :less_than_or_equal_to => 3
  }

  validates_with ScheduleValidator

  def to_hash
    [
      :day_of_week => self.day_of_week,
      :double_class_number => self.double_class_number,
      :numerator_denominator => self.numerator_denominator,
      :subgroup => self.subgroup
    ]
  end

  def to_s
    "%s %s" % [self.double_class.subject.name, self.double_class.teacher.first_name]
  end

  def for_all_group?
    self.subgroup == 3
  end

  def for_every_time?
    self.numerator_denominator == 3
  end

  def always?
    for_all_group? and for_every_time?
  end

  def equivalent_with?(schedule)
    self.subgroup == schedule.subgroup and self.numerator_denominator == schedule.numerator_denominator
  end

  def schedule_humanize
    num_den_title = case self.numerator_denominator
      when 1
        I18n.t('active_admin.schedule.numerator')
      when 2
        I18n.t('active_admin.schedule.denominator')
      when 3
        I18n.t('active_admin.schedule.numerator_and_denominator')
      else
        I18n.t('active_admin.schedule.invalid_value')
    end

    day_title = case self.day_of_week
      when 1
        I18n.t('active_admin.schedule.days.monday')
      when 2
        I18n.t('active_admin.schedule.days.tuesday')
      when 3
        I18n.t('active_admin.schedule.days.wednesday')
      when 4
        I18n.t('active_admin.schedule.days.thursday')
      when 5
        I18n.t('active_admin.schedule.days.friday')
      when 6
        I18n.t('active_admin.schedule.days.saturday')
      when 7
        I18n.t('active_admin.schedule.days.sunday')
      else
        I18n.t('active_admin.schedule.invalid_value')
    end

    if subgroup > 2
      subgroup_title = I18n.t('active_admin.schedule.first_n_second_subgroup')
    else
      subgroup_title = subgroup.to_s
    end

    I18n.t('active_admin.schedule.error_format_string') %  [day_title,
                                                            double_class_number,
                                                            subgroup_title,
                                                            num_den_title,
                                                            double_class.study_group.group.name,
                                                            double_class.subject.name,
                                                            double_class.teacher.first_name]
  end

  def same?(schedule)
    self.id == schedule.id
  end

  def blank?
    self.subgroup.nil? or self.numerator_denominator.nil? or self.day_of_week.nil? or self.double_class_number.nil?
  end

  def invalid_schedule?(exists_schedules, error_title)
    return true if blank?
    errors = []
    if self.always?
      exists_schedules.each do |schedule_record|
        errors << schedule_record.schedule_humanize unless self.same? schedule_record
      end
    elsif self.for_all_group?
      exists_schedules.each do |schedule_record|
        if schedule_record.always?
          errors << schedule_record.schedule_humanize
        elsif schedule_record.equivalent_with? self
          errors << schedule_record.schedule_humanize
        elsif schedule_record.for_every_time?
          errors << schedule_record.schedule_humanize
        elsif schedule_record.numerator_denominator == self.numerator_denominator
          errors << schedule_record.schedule_humanize
        end
      end
    elsif self.for_every_time?
      exists_schedules.each do |schedule_record|
        if schedule_record.always?
          errors << schedule_record.schedule_humanize
        elsif schedule_record.equivalent_with? self
          errors << schedule_record.schedule_humanize
        elsif schedule_record.for_all_group?
          errors << schedule_record.schedule_humanize
        elsif schedule_record.subgroup == self.subgroup
          errors << schedule_record.schedule_humanize
        end
      end
    else
      exists_schedules.each do |schedule_record|
        if schedule_record.always?
          errors << schedule_record.schedule_humanize
        elsif schedule_record.equivalent_with? self
          errors << schedule_record.schedule_humanize
        elsif schedule_record.for_all_group? and schedule_record.numerator_denominator == self.numerator_denominator
          errors << schedule_record.schedule_humanize
        elsif schedule_record.for_every_time? and schedule_record.subgroup == self.subgroup
          errors << schedule_record.schedule_humanize
        end
      end
    end
    self.errors[:base] << error_title + errors.to_s unless errors.empty?

    not errors.empty?
  end
end

