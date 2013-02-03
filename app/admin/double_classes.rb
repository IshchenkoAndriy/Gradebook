ActiveAdmin.register DoubleClass do
  belongs_to :study_group
  
  config.batch_actions = false
  
  filter :double_class_type
  filter :teacher
  filter :day_of_week
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.double_class.new_action"), new_admin_study_group_double_class_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.double_class.edit_action"), edit_admin_study_group_double_class_path(:study_group_id => resource.study_group_id, :id => resource.id)
  end
  
  index :download_links => false, :title => I18n.t("active_admin.double_class.title_index") do
    column :double_class_type
    column :subject
    column :teacher
    column :subgroup
    column :numerator_denominator
    column :double_class_number
    column :day_of_week
    
    default_actions
  end
  
    form do |f|
    f.inputs I18n.t("active_admin.double_class.details") do
      f.input :study_group
      f.input :double_class_type
      f.input :subject
      f.input :teacher
      f.input :subgroup
      f.input :numerator_denominator
      f.input :double_class_number
      f.input :day_of_week
    end
    f.buttons
  end
  
  show :title => :name do
    attributes_table do
      row :study_group
      row :double_class_type
      row :subject
      row :teacher
      row :subgroup
      row :numerator_denominator
      row :double_class_number
      row :day_of_week
      
      row :created_at
      row :updated_at
    end
  end
end
