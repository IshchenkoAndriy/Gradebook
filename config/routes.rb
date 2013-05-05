Kntu::Application.routes.draw do

  resources :main, :only => :index
  root :to => 'main#index'

  ActiveAdmin.routes(self)
  
  namespace :admin do
    resources :semesters do
      resources :study_groups do
        resources :double_classes
        resources :students_in_groups
      end
    end
  end
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :developers, defaults: {format: 'html'}, :only => [:index]
      
      resources :semesters, :only => [:index, :show] do
        resources :groups, :only => [:index] do
          resources :students, :only => [:index] do
            resources :subjects, :only => [:index, :show]
          end
        end
      end
      resources :groups, :only => [:show]
      resources :students, :only => [:show]
      resources :search_group, :only => [:index]
      resources :search_student, :only => [:index]
    end
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  mount Ckeditor::Engine => '/ckeditor'

  # Student pages
  resources :articles
  resources :semesters, :only => [:index, :show] do
    resources :study_groups, :only => [:index]
    resources :teacher, :only => [:index, :show]
  end
  resources :study_groups, :only => [] do
    resources :students, :only => [:index, :show]
    resources :group_schedule, :only => [:index]
  end

  # Teacher pages
  resources :teacher_semesters, :only => [:index, :show] do
    resources :double_classes, :only => [:index]
  end
  resources :double_classes, :only =>[] do
    resources :lessons, :only => [:index, :new, :create]
    resources :additional_mark, :only => [:index, :new, :create, :edit, :update, :destroy]
    resources :visual_editor, :only => [:index]
  end
  resources :lessons, :only => [:edit, :update, :destroy] do
    resources :lesson_mark, :only => [:index, :new, :create, :edit, :update, :destroy]
    resources :presence, :only => [:index, :new, :create, :edit, :update, :destroy]
  end
  
  devise_for :users
end
