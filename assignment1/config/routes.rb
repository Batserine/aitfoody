Rails.application.routes.draw do
  root "assignment#index"
  get 'project'        => 'assignment#index', as: 'project'
  get 'divide_by_zero' => 'assignment#divide_by_zero', as: 'divide_by_zero'
  get 'fetch_news/:category', to: "assignment#fetch_news"

  get "basics/quotations"     => "basics#quotations"
  get "basics/kill_quote/:id" => "basics#kill_quote"
  get "basics/search"         => "basics#search", :as => :search
  get "basics/import_xml"   => "basics#import_xml"   , :as => :import_xml
  # get "basics/read_txtfile" => "basics#read_txtfile" , :as => :read_txtfile
  # post "basics/import2db"  => "basics#import2db", :as => :import2db
  post "basics/import_xml"   => "basics#import_xml"
  post "basics/quotations"   => "basics#quotations" , :as => :quotation
  get "basics/destroy"       => "basics#destroy_cookies"

  get "basiclink"            => "assignment#basics"

  resources :assignment
  resources :basics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
