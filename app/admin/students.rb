ActiveAdmin.register Student do
  config.batch_actions = false
  
  filter :first_name, :label => I18n.t('active_admin.student.search_first_name')
  filter :second_name, :label => I18n.t('active_admin.student.search_second_name')
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
    column :first_name
    column :second_name
    column :patronymic
    column :email
    default_actions
  end
  
  form do |f|
    f.inputs I18n.t("active_admin.student.details") do
      f.input :first_name
      f.input :second_name
      f.input :patronymic
      f.input :email
    end
    f.actions
  end
  
  show :title => :name do
    attributes_table do
      row :first_name
      row :second_name
      row :patronymic
      row :email
    end
  end
end
