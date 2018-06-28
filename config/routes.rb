Rails.application.routes.draw do

  resources :applications

  devise_for :users

  get 'about' => 'welcome#about'
  root to: "welcome#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
