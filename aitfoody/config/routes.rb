Rails.application.routes.draw do


  get 'myarticles/index'
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount RailsAdmin::Engine => '/admin', :as => :rails_admin
  resources :ingredients
  devise_for :users
  resources :comments
  resources :revarticles
  resources :revarticles do
    resources :comments
  end
  resources :revarticles do
    resources :ingredients
  end
  resources :revarticles do
    resources :versions, only: [:destroy] do
      member do
        get :diff, to: 'versions#diff'
        patch :rollback, to: 'versions#rollback'
      end
    end
  end
  root "revarticles#index" , :as => :homepage
  get  "articles"   => "myarticles#index", :as => :myRevarticles
  get  "articles/user/:user_id"   => "myarticles#user", :as => :userRevarticles
  get  "articles/type/:food"   => "myarticles#typefood", :as => :typeRevarticles
  post "revarticles/:id"   => "comments#create"  , :as => :addComments
  post "api/ban_user"      => "api#ban_user"     , :as => :banUser
  post "api/create_chart_sex"       => "api#create_chart_sex" , :as => :createChartSex
  post "api/create_chart_createdAt"  => "api#create_chart_createdAt" , :as => :createChartCreatedAt
  get  "backend/statistics" => "backend#show_statistics",  :as => :statistics
  get  "profile"   => "users#edit", :as => :myProfile
  post "update_profile"   => "users#update_profile", :as => :updateProfile
  # post "update_password"   => "users#update_password", :as => :updateProfile
  get  "search"   => "api#search"  , :as => :search
  #[not use] get  "backend/users" => "backend#show_user",  :as => :manageUser
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
