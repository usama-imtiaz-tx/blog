Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get 'welcome/index'
  get 'users/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :articles do
    resources :comments
  end
  
  root 'welcome#index'

end
