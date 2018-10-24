Rails.application.routes.draw do

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
  root "revarticles#index"

  post "revarticles/:id"   => "comments#create"  , :as => :addComments
  post "api/ban_user"      => "api#ban_user"     , :as => :banUser
  post "api/create_chart_sex"       => "api#create_chart_sex" , :as => :createChartSex
  post "api/create_chart_createdAt"  => "api#create_chart_createdAt" , :as => :createChartCreatedAt
  get  "backend/users" => "backend#show_user",  :as => :manageUser
  get  "backend/statistics" => "backend#show_statistics",  :as => :statistics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
