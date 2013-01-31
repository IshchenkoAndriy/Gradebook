ActiveAdmin.register Group do
  filter :name, :label => I18n.t('active_admin.group.search_name')
  
  index do
    column :name
    column :created_at
    column :updated_at
    column I18n.t("active_admin.group.students_in_group_header") do |group|
      @study_group = group.study_groups.last 
      link_to(I18n.t("active_admin.group.students_in_group_link"), 
               admin_group_students_in_groups_path(group, :semester => @study_group.semester.id)) if @study_group
    end
    default_actions
  end
end
