Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists
  resources :items do 
    member do 
      put 'toggle_complete'
    end
  end  

end
