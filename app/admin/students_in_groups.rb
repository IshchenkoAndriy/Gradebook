ActiveAdmin.register StudentsInGroup do
  belongs_to :group
  filter :subgroup
  
  # Disable all batch actions
  config.batch_actions = false
  #config.filters = false
  config.sort_order = "study_group_id_desc"
  
  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.students_in_group.new_action"), new_admin_group_students_in_group_path
  end
  
  action_item only:[:show] do
    link_to I18n.t("active_admin.students_in_group.edit_action"), edit_admin_group_students_in_group_path(
        :group_id => resource.study_group.group.id, 
        :id => resource.id)
  end
  
  menu :label => I18n.t("active_admin.students_in_group.menu")
  
  controller do
    def default_url_options(options={})
      if params[:semester_id].present?
        options.merge({ :semester_id => params[:semester_id], :locale => I18n.locale })
      else
        options
      end
    end
    
    def index
      if params[:semester_id].present?
        index!
      else
        @group = Group.find_by_id(params[:group_id])
        if @group
          @study_group = @group.study_groups.last
          if @study_group
            redirect_to admin_group_students_in_groups_path(@group, :semester_id => @study_group.semester.id)
          end
        end     
      end
    end
    
    def new
      @students_in_group = StudentsInGroup.new
      @study_group = StudyGroup.find_by_group_id_and_semester_id(params[:group_id], params[:semester_id])
      if @study_group
        @students_in_group.study_group = @study_group
      end
      new!
    end

    def scoped_collection
      if params[:semester_id].present?
        begin
          @study_group = StudyGroup.find_by_group_id_and_semester_id(params[:group_id], params[:semester_id])
          end_of_association_chain.where(:study_group_id => @study_group)
        rescue
        end
      else
       end_of_association_chain
      end
    end
  end
  
  index :download_links => false, :title => I18n.t("active_admin.students_in_group.title_index") do
    div :class => "table_tools" do
      ul :class => "scopes table_tools_segmented_control" do
        StudyGroup.where(group_id: params[:group_id]).each do |study_group|
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
              raw("#{study_group.semester.study_date} #{link_html.to_s}"), 
              { :semester_id => study_group.semester.id }, 
              :class => "table_tools_button").to_s
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
      f.input :study_group, :collection => Hash[StudyGroup.order("created_at DESC").where(group_id: self.group).map{|sg| [sg.semester.name, sg.id]}]
      f.input :student
      f.input :subgroup
    end
    f.buttons
  end
  
  show :title => :name do
    attributes_table do
      row :student
      row :subgroup
      row :created_at
      row :updated_at
    end
  end
end