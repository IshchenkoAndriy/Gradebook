ActiveAdmin.register Group do
  config.batch_actions = false
  
  filter :name, :label => I18n.t('active_admin.group.search_name')
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.group.new_action"), new_admin_group_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.group.edit_action"), edit_admin_group_path(resource)
  end
  
  menu :label => I18n.t("active_admin.group.menu")
  
  index :download_links => false, :title => I18n.t("active_admin.group.title_index") do
    column :name
    column I18n.t("active_admin.group.students_in_group_header") do |group|
      @study_group = group.study_groups.last 
      link_to(I18n.t("active_admin.group.students_in_group_link"), 
        admin_semester_study_group_students_in_groups_path(:study_group_id => @study_group.id, 
                                                            :semester_id => @study_group.semester_id)) if @study_group
    end
    default_actions
  end
  
  form do |f|
    f.inputs I18n.t("active_admin.group.details") do
      f.input :name
    end
    f.actions
  end
  
  show :title => :name do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
      row I18n.t("active_admin.group.semesters") do |group|
        table do
          tbody do
            study_groups = StudyGroup.where(group_id: group.id)
            
            study_groups.each do |study_group|
              tr do
                td study_group.semester.name
                
                td link_to(I18n.t("active_admin.group.students_in_group_link"),
                  admin_semester_study_group_students_in_groups_path(
                    :study_group_id => study_group.id,
                    :semester_id => study_group.semester_id))
                    
                td link_to(I18n.t("active_admin.group.subjects_link"),
                  admin_semester_study_group_double_classes_path(
                    :study_group_id => study_group.id,
                    :semester_id => study_group.semester_id))
              end
            end
          end
        end
      end
    end
  end
end
