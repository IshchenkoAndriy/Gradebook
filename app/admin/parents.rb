ActiveAdmin.register Parent do
  config.batch_actions = false

  filter :last_name, :label => I18n.t('active_admin.parent.search_last_name')
  filter :first_name, :label => I18n.t('active_admin.parent.search_first_name')
  filter :patronymic
  filter :phone, :label => I18n.t('active_admin.parent.search_phone')

  menu :label => I18n.t('activerecord.models.parents.many')

  index :download_links => false, :title => I18n.t("active_admin.parent.title_index") do
    column :last_name
    column :first_name
    column :patronymic
    column :email
    column :phone
    default_actions
  end

  form do |f|
    def generate_form_for_student(form)
      if form.object.new_record?
        form.input :student
      else
        form.input :student
        form.input :_destroy, :as=>:boolean, :required => false, :label=> I18n.t('active_admin.has_many_delete')
      end
    end

    f.inputs I18n.t("active_admin.parent.details") do
      f.input :last_name
      f.input :first_name
      f.input :patronymic
      f.input :email
      f.input :phone
    end

    unless f.object.new_record?
      f.inputs I18n.t('activerecord.models.student.many') do
        f.has_many :relationships do |student|
          student.semantic_errors :base
          generate_form_for_student student
        end
      end
    end
    f.actions
  end

  show :title => :full_name do |parent|
    attributes_table do
      row :last_name
      row :first_name
      row :patronymic
      row :phone
    end

    panel I18n.t('activerecord.models.student.many') do
      parent.students.each do |student|
        attributes_table_for :students do
          row '' do
            student.full_name
          end
        end
      end
    end
  end

end
