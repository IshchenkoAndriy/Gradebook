module ActiveAdmin
  module Views
    module Pages
      class Index
        def build_table_tools
          batch_actions = active_admin_config.batch_actions.any?
          scopes = active_admin_config.scopes.any?
          indexes = active_admin_config.page_presenters[:index].try(:length).try(:>, 1)
          return unless [batch_actions, scopes, indexes].any?
          div :class => "table_tools" do
            build_batch_actions_selector
            build_scopes
            build_index_list
          end
        end
      end
    end
  end
end