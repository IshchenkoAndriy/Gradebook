ActiveAdmin.register AdminUser do
  config.batch_actions = false
  config.filters = false
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.admin_user.new_action"), new_admin_admin_user_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.admin_user.edit_action"), edit_admin_admin_user_path(resource)
  end
  
  menu :label => I18n.t("active_admin.admin_user.menu")
  
  index :download_links => false, :title => I18n.t("active_admin.admin_user.title_index") do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end
  
  form do |f|
    f.inputs I18n.t("active_admin.admin_user.details") do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :email
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
      row :last_sign_in_ip
      row :current_sign_in_ip
      row :created_at
      row :updated_at
    end
  end                             
end                                   
