ActiveAdmin.register StudyType do
  config.batch_actions = false
  
  filter :name, :label => I18n.t('active_admin.study_type.search_name')
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.study_type.new_action"), new_admin_study_type_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.study_type.edit_action"), edit_admin_study_type_path(resource)
  end
  
  menu :label => I18n.t("active_admin.study_type.menu")
  
  index :download_links => false, :title => I18n.t("active_admin.study_type.title_index") do
    column :name
    default_actions
  end
  
  form do |f|
    f.inputs I18n.t("active_admin.study_type.details") do
      f.input :name
    end
    f.actions
  end
  
  show :title => :name do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
  end
end
