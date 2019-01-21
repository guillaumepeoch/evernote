Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :folders
  resources :notes
end
