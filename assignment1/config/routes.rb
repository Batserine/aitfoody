Rails.application.routes.draw do
  root "assignment#index"
  get 'project'        => 'assignment#index', as: 'project'
  get 'divide_by_zero' => 'assignment#divide_by_zero', as: 'divide_by_zero'
  get 'fetch_news/:category', to: "assignment#fetch_news"

  resources :assignment
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
