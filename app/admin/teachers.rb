ActiveAdmin.register Teacher do
  config.batch_actions = false

  filter :last_name, :label => I18n.t('active_admin.teacher.search_last_name')
  filter :first_name, :label => I18n.t('active_admin.teacher.search_first_name')
  filter :patronymic
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.teacher.new_action"), new_admin_teacher_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.teacher.edit_action"), edit_admin_teacher_path(resource)
  end
  
  menu :label => I18n.t("active_admin.teacher.menu")
  
  index :download_links => false, :title => I18n.t("active_admin.teacher.title_index") do
    column :last_name
    column :first_name
    column :patronymic
    column :email
    default_actions
  end
  
  form do |f|
    f.inputs I18n.t("active_admin.teacher.details") do
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
