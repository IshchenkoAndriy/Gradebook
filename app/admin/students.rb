ActiveAdmin.register Student do
  config.batch_actions = false

  filter :last_name, :label => I18n.t('active_admin.student.search_last_name')
  filter :first_name, :label => I18n.t('active_admin.student.search_first_name')
  filter :patronymic
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.student.new_action"), new_admin_student_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.student.edit_action"), edit_admin_student_path(resource)
  end
  
  menu :label => I18n.t("active_admin.student.menu")
  
  index :download_links => false, :title => I18n.t("active_admin.student.title_index") do
    column :last_name
    column :first_name
    column :patronymic
    column :email
    default_actions
  end
  
  form do |f|
    f.inputs I18n.t("active_admin.student.details") do
      f.input :last_name
      f.input :first_name
      f.input :patronymic
      f.input :email
    end
    f.actions
  end
  
  show :title => :full_name do
    attributes_table do
      row :last_name
      row :first_name
      row :patronymic
      row :email
    end
  end
end
