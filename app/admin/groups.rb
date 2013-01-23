I18n.reload!

ActiveAdmin.register Group do
   filter :name, :label => I18n.t('active_admin.admin_page.search_name')
   filter :created_at
   filter :updated_at
   
   index do
    selectable_column
    column :name
    column :created_at
    column :updated_at
    default_actions
  end
end
