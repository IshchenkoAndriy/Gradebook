ActiveAdmin.register Subject do
  config.batch_actions = false
  
  filter :name, :label => I18n.t('active_admin.subject.search_name')
  filter :subject_type, :label => I18n.t('active_admin.subject.search_subject_type')
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.subject.new_action"), new_admin_subject_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.subject.edit_action"), edit_admin_subject_path(resource)
  end
  
  menu :label => I18n.t("active_admin.subject.menu")
  
  index :download_links => false, :title => I18n.t("active_admin.subject.title_index") do
    column :name
    column :subject_type
    default_actions
  end
  
  form do |f|
    f.inputs I18n.t("active_admin.subject.details") do
      f.input :name
      f.input :subject_type
    end
    f.actions
  end
  
  show :title => :name do
    attributes_table do
      row :name
      row :subject_type
      row :created_at
      row :updated_at
    end
  end
end
