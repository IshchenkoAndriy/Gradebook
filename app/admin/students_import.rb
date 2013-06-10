ActiveAdmin.register_page "Import" do
  menu false

  page_action :do_import, :method => :post do
    begin
      @study_group = StudyGroup.where(id: params[:study_group_id]).first
      @study_group.attributes = params[:study_group]

      ActiveRecord::Base.transaction do
        @study_group.students_in_groups.each { |students_in_group| students_in_group.save! }
      end

      redirect_to admin_semester_study_group_students_in_groups_path(@study_group.semester_id, @study_group),
                    notice: I18n.t("active_admin.import.success_import")
    rescue
      redirect_to :back, flash: {error: I18n.t("active_admin.import.fail_import") }
    end
  end

  content :title => proc{ I18n.t("active_admin.import.title_index") } do
    def generate_form_for_student(form)
      if form.object.new_record?
        form.input :student
        form.input :subgroup
      else
        form.input :student
        form.input :subgroup
        form.input :_destroy, :as=>:boolean, :required => false, :label=> I18n.t('active_admin.has_many_delete')
      end
    end

    columns do
      column do
        panel I18n.t("active_admin.import.students_list") do
          semantic_form_for assigns[:study_group],
                            :url => admin_import_do_import_path(study_group_id: assigns[:study_group].id),
                            :builder => ActiveAdmin::FormBuilder,
                            :html => {:method => :post}  do |f|

            f.inputs :title => '' do
              f.has_many :students_in_groups do |students_in_group|
                generate_form_for_student students_in_group
              end
            end

            f.actions do
              f.action :submit
            end
          end
        end
      end
    end
  end

  controller do
    def index
      @study_group = StudyGroup.where(id: params[:study_group_id]).first
      @study_group.import_students
      super
    end
  end
end
