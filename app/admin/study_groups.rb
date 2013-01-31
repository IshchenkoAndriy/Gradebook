ActiveAdmin.register StudyGroup do
  belongs_to :semester
  
  filter :group
  filter :teacher
  
  index do
    column :group
    column :teacher
    column I18n.t("active_admin.group.students_in_group_header") do |study_group|
      link_to(I18n.t("active_admin.group.students_in_group_link"), 
               admin_group_students_in_groups_path(study_group.group, :semester => study_group.semester.id)) if study_group
    end
    
    default_actions
  end
end
