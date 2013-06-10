ActiveAdmin.register StudentsInGroup do
  controller.belongs_to :semester, :study_group
  filter :subgroup
  
  # Disable all batch actions
  config.batch_actions = false
  #config.filters = false
  config.sort_order = "study_group_id_desc"
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.students_in_group.new_action"), new_admin_semester_study_group_students_in_group_path
  end

  action_item only:[:index], :if => proc{ StudyGroup.where(id: params[:study_group_id]).first.students_in_groups.count == 0 } do
    link_to I18n.t("active_admin.students_in_group.import_action"), admin_semester_study_group_import_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.students_in_group.edit_action"), edit_admin_semester_study_group_students_in_group_path(:study_group_id => resource.study_group_id, :id => resource.id)
  end
  
  menu false

  index :download_links => false, :title => I18n.t("active_admin.students_in_group.title_index") do
    @study_group = StudyGroup.where(id: params[:study_group_id]).first
    if @study_group
      div :class => "table_tools" do
        ul :class => "scopes table_tools_segmented_control" do
          StudyGroup.where(group_id: @study_group.group_id).each do |study_group|
            li_class = "scope"
            li_class += " selected" if params[:semester_id].to_i == study_group.semester.id
            li :class => li_class do
              link_html = Arbre::Context.new do
                span :class => 'count' do
                  "(" +
                  study_group.students.count.to_s +
                  ")"
                end
              end
              link_to(
                raw("#{study_group.semester.name} #{link_html.to_s}"),
                { :semester_id => study_group.semester_id, :study_group_id => study_group.id  },
                :class => "table_tools_button").to_s
            end
          end
        end
      end
    end
    column :student
    column :subgroup
    default_actions
  end
  
  form do |f|
    f.inputs "" do
      f.input :study_group, :collection => Hash[
        StudyGroup.order("created_at DESC").where(
          group_id: StudyGroup.where(id: params[:study_group_id]).first.group_id).map{
            |sg| [sg.semester.name, sg.id]
          }
        ]
      f.input :student
      f.input :subgroup
    end
    f.buttons
  end
  
  show :title => :full_name do
    attributes_table do
      row :student
      row :subgroup
      row :created_at
      row :updated_at
    end
  end
end