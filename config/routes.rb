Rails.application.routes.draw do
  root 'folders#index'
  
  resources :folders do
    resources :notes
  end

end
