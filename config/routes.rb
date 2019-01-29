Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :folders
  resources :notes
  
  match '/get_notes/:id', to: 'folders#get_notes', via: [:get]
end
