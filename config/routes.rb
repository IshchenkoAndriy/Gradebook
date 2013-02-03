Kntu::Application.routes.draw do
  ActiveAdmin.routes(self)
  
  namespace :admin do
    resources :semesters do
      resources :study_groups do
        resources :double_classes
      end
    end
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  mount Ckeditor::Engine => '/ckeditor'
  
  resources :articles
  
  get "main/index"
  
  root :to => 'main#index'
  
  devise_for :users
end
