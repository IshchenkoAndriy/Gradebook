ActiveAdmin.register Semester do
  filter :semester_type
  filter :begin_date
  filter :end_date
  
  form do |f|
    f.inputs "" do
      f.input :semester_type
      f.input :begin_date
      f.input :end_date
    end
    f.buttons
  end
  
  index do
    column :semester_type
    column :begin_date
    column :end_date
    column I18n.t("active_admin.semester.group_header") do |semester|
      link_to I18n.t("active_admin.semester.group_link"), [:admin, semester, :study_groups]
    end
    default_actions
  end
end