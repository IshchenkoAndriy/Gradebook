ActiveAdmin.register Semester do
  config.filters = false
  
  config.batch_actions = false
  
  scope :all, :default => true
  SemesterType.all.each do |semester_type|
    self.send(:scope, semester_type.name) do |items|
      items.where(:semester_type_id => semester_type.id)
    end
  end
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.semester.new_action"), new_admin_semester_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.semester.edit_action"), edit_admin_semester_path(resource)
  end
  
  menu :label => I18n.t("active_admin.semester.menu")
  
  index :download_links => false, :title => I18n.t("active_admin.semester.title_index") do
    column :semester_type
    column :begin_date
    column :end_date
    column I18n.t("active_admin.semester.group_header") do |semester|
      link_to I18n.t("active_admin.semester.group_link"), [:admin, semester, :study_groups]
    end
    default_actions
  end
  
  form do |f|
    f.inputs I18n.t("active_admin.semester.details") do
      f.input :semester_type
      f.input :begin_date
      f.input :end_date
    end
    f.buttons
  end
  
  show :title => :name do
    attributes_table do
      row :semester_type
      row :begin_date
      row :end_date
    end
  end
end