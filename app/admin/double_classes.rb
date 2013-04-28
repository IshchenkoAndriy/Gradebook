ActiveAdmin.register DoubleClass do
  controller.belongs_to :semester, :study_group
  
  config.batch_actions = false
  
  filter :double_class_type
  filter :teacher
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.double_class.new_action"), new_admin_semester_study_group_double_class_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.double_class.edit_action"), edit_admin_semester_study_group_double_class_path(:study_group_id => resource.study_group_id, :id => resource.id)
  end
  
  menu false
  
  index :download_links => false, :title => I18n.t("active_admin.double_class.title_index") do
    column :double_class_type
    column :subject
    column :teacher
    column :presence_score

    default_actions
  end


  form do |f|
    def generate_form(form)
      if form.object.new_record?
        generate_input_fields form
      else
        generate_input_fields form
        form.input :_destroy, :as=>:boolean, :required => false, :label=> I18n.t('active_admin.has_many_delete')
      end
    end


    def generate_input_fields(form)
      form.input :subgroup, :as => :radio, :collection => {
          '1' => 1,
          '2' => 2,
          I18n.t('active_admin.schedule.first_n_second_subgroup') => 3}
      form.input :numerator_denominator, :as => :radio, :collection => {
          I18n.t('active_admin.schedule.numerator') => 1,
          I18n.t('active_admin.schedule.denominator') => 2,
          I18n.t('active_admin.schedule.numerator_and_denominator') => 3

      }
      form.input :double_class_number, :as => :select, :collection => [1, 2, 3, 4, 5, 6]
      form.input :day_of_week, :as => :select, :collection => [
          [I18n.t('active_admin.schedule.days.monday'), 1],
          [I18n.t('active_admin.schedule.days.tuesday'), 2],
          [I18n.t('active_admin.schedule.days.wednesday'), 3],
          [I18n.t('active_admin.schedule.days.thursday'), 4],
          [I18n.t('active_admin.schedule.days.friday'), 5],
          [I18n.t('active_admin.schedule.days.saturday'), 6],
          [I18n.t('active_admin.schedule.days.sunday'), 7]
      ]
      form.input :classroom_number
    end

    f.inputs I18n.t("active_admin.double_class.details") do
      f.input :study_group
      f.input :double_class_type
      f.input :subject
      f.input :teacher
      f.input :presence_score
    end

    unless f.object.new_record?
      f.inputs I18n.t('active_admin.schedule.title_index') do
        f.has_many :schedules do |schedule|
          schedule.semantic_errors :base
          generate_form schedule
        end
      end
    end
    f.actions
  end
  
  show :title => :name do |double_class|
    attributes_table do
      row :study_group
      row :double_class_type
      row :subject
      row :teacher
      row :presence_score
      
      row :created_at
      row :updated_at
    end

    panel I18n.t('active_admin.schedule.title_index') do
      double_class.schedules.each do |schedule|
        attributes_table_for :schedule do
          row I18n.t('activerecord.attributes.schedule.subgroup') do
            if schedule.subgroup > 2
              I18n.t('active_admin.schedule.first_n_second_subgroup')
            else
              schedule.subgroup
            end
          end
          row I18n.t('activerecord.attributes.schedule.numerator_denominator') do
            case schedule.numerator_denominator
              when 1
                I18n.t('active_admin.schedule.numerator')
              when 2
                I18n.t('active_admin.schedule.denominator')
              when 3
                I18n.t('active_admin.schedule.numerator_and_denominator')
              else
                I18n.t('active_admin.schedule.invalid_value')
            end
          end
          row I18n.t('activerecord.attributes.schedule.double_class_number') do schedule.double_class_number end
          row I18n.t('activerecord.attributes.schedule.day_of_week') do
            case schedule.day_of_week
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
          end
          row I18n.t('activerecord.attributes.schedule.classroom_number') do schedule.classroom_number end
        end
      end
    end
  end
end
