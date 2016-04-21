Rails.application.routes.draw do
  resources :pictures
  resources :questions
  resources :members
  resources :events
  resources :news
  resources :applicants
  root to: 'visitors#index'
  devise_for :users
  resources :users
  
  
  get 'matching_system' => 'companies#matchpg'
  
  
  resources :companies do 
    collection do
      put :emp
    end
  end
  
end
