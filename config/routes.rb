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
            resources :subjects, :only => [:show]
          end
          resources :subjects, :only => [:index, :show]
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
  
  resources :articles
  resources :semesters, :only => [:index, :show] do
    resources :groups, :only => [:index] do
      resources :students, :only => [:index]
      resources :group_schedule, :only => [:index]
    end
    resources :teacher, :only => [:index, :show]
  end
  
  devise_for :users
end
