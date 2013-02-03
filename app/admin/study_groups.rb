ActiveAdmin.register StudyGroup do
  belongs_to :semester
  
  config.batch_actions = false
  
  filter :group
  filter :teacher
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.study_group.new_action"), new_admin_semester_study_group_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.study_group.edit_action"), edit_admin_semester_study_group_path(:semester_id => resource.semester_id, :id => resource.id)
  end
  
  index :download_links => false, :title => I18n.t("active_admin.study_group.title_index") do
    column :group
    column :teacher
    column I18n.t("active_admin.group.students_in_group_header") do |study_group|
      link_to(I18n.t("active_admin.group.students_in_group_link"), 
               admin_group_students_in_groups_path(study_group.group, :semester_id => study_group.semester.id)) if study_group
    end
    
    column I18n.t("active_admin.group.double_class_header") do |study_group|
      link_to(I18n.t("active_admin.group.double_class_link"), 
               admin_semester_study_group_double_classes_path(study_group.group, :semester_id => study_group.semester.id)) if study_group
    end
    default_actions
  end
  
  form do |f|
    f.inputs I18n.t("active_admin.study_group.details") do
      f.input :semester
      f.input :group
      f.input :teacher
    end
    f.buttons
  end
  
  show :title => :name do
    attributes_table do
      row :semester
      row :group
      row :teacher
      row :created_at
      row :updated_at
    end
  end
end
