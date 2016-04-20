Rails.application.routes.draw do
  resources :questions
  resources :members
  resources :events
  resources :news
  resources :applicants
  root to: 'visitors#index'
  devise_for :users#, controllers: { registrations: "registrations"}
  resources :users
  
  
  get 'matching_system' => 'companies#matchpg'
  
  
  resources :companies do 
    collection do
      put :emp
    end
  end
  
end
