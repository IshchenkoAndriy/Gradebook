ActiveAdmin.register Group do
   filter :name, :label => I18n.t('active_admin.group.search_name')
   
   index do
    #selectable_column
    column :name
    column :created_at
    column :updated_at
    default_actions
  end
end
