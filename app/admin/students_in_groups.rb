ActiveAdmin.register StudentsInGroup do
  #actions :all, :except => [:index]
  belongs_to :group
  filter :subgroup
  
  # Disable all batch actions
  config.batch_actions = false
  #config.filters = false
  config.sort_order = "study_group_id_desc"
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.students_in_group.new_action"), new_admin_group_students_in_group_path(:semester => params[:semester])
  end
  
  controller do
    def new
      @students_in_group = StudentsInGroup.new
      @study_group = StudyGroup.find_by_group_id_and_semester_id(params[:group_id], params[:semester])
      if @study_group
        @students_in_group.study_group = @study_group
      end
      new!
    end

    def scoped_collection
      if params[:semester].present?
        begin
          @study_group = StudyGroup.find_by_group_id_and_semester_id(params[:group_id], params[:semester])
          end_of_association_chain.where(:study_group_id => @study_group)
        rescue
        end
      else
       end_of_association_chain
      end
    end
  end
  
  index do
    div :class => "table_tools" do
      ul :class => "scopes table_tools_segmented_control" do
        StudyGroup.where(group_id: params[:group_id]).each do |study_group|
          li_class = "scope"
          li_class += " selected" if params[:semester].to_i == study_group.semester.id
          li :class => li_class, do
            link_html = Arbre::Context.new do
              span :class => 'count', do 
                "(" +
                study_group.students.count.to_s +
                ")"
              end
            end
            
            link_to( raw("#{study_group.semester.study_date} #{link_html.to_s}"), { :semester => study_group.semester.id }, :class => "table_tools_button").to_s
            
          end
        end
      end
    end
    
    column :student
    column :scholarship
    column :hostel
    column :subgroup   
    default_actions
  end
  
  form do |f|
    f.inputs "" do
      f.input :study_group, :collection => Hash[StudyGroup.order("created_at DESC").where(group_id: self.group).map{|sg| [sg.semester.name, sg.id]}]
      f.input :student
      f.input :scholarship
      f.input :hostel
      f.input :subgroup
    end
    f.buttons
  end
end