ActiveAdmin.register User do
  config.batch_actions = false
  config.filters = false

  config.clear_action_items!
  action_item only:[:index, :show] do
    link_to I18n.t("active_admin.user.new_action"), new_admin_user_path
  end

  action_item only:[:show] do
    link_to I18n.t("active_admin.user.edit_action"), edit_admin_user_path(resource)
  end

  index :download_links => false, :title => I18n.t("active_admin.user.title_index") do
    column :email
    column :current_sign_in_at
    column :capabilities do |user|
      user.capabilities.map{ |capability|
        I18n.t("active_admin.user.capabilities.#{capability}")
      }.join('; ')
    end
    default_actions
  end

  form do |f|
    f.inputs I18n.t("active_admin.user.details") do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :capabilities,
              :as => :check_boxes,
              :collection => User::CAPABILITIES.map{ |capability|
                [ I18n.t("active_admin.user.capabilities.#{capability}"), capability ]
              }
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :capabilities do |user|
        user.capabilities.map{ |capability|
          I18n.t("active_admin.user.capabilities.#{capability}")
        }.join('; ')
      end
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
      row :last_sign_in_ip
      row :current_sign_in_ip
      row :created_at
      row :updated_at
    end
  end

  controller do
    def create
      capabilities = params[:user].delete(:capabilities) & User::CAPABILITIES

      super

      user = User.where(email: params[:user][:email]).first
      if user
        user.capabilities=(capabilities)
        user.save
      end
    end

    def update
      capabilities = params[:user].delete(:capabilities) & User::CAPABILITIES

      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end

      super

      user = User.where(id: params[:id]).first
      if user
        user.capabilities=(capabilities)
        user.save
      end
    end
  end
end
