ActiveAdmin.register Semester do
  filter :year
  
  config.batch_actions = false
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.semester.new_action"), new_admin_semester_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.semester.edit_action"), edit_admin_semester_path(resource)
  end
  
  menu :label => I18n.t("active_admin.semester.menu")
  
  index :download_links => false, :title => I18n.t("active_admin.semester.title_index") do
    column :year
    column :title
    column I18n.t("active_admin.semester.group_header") do |semester|
      link_to I18n.t("active_admin.semester.group_link"), [:admin, semester, :study_groups]
    end
    default_actions
  end
  
  form do |f|
    f.inputs I18n.t("active_admin.semester.details") do
      f.input :year
      f.input :title
    end
    f.buttons
  end
  
  show :title => :name do
    attributes_table do
      row :year
      row :title
    end
  end
end