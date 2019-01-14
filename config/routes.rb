Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :collections
  
  resources :macroregions, only: [:index] do
    resources :microregions, only: [:index]
  end

  resources :stations, only: [:index]

end
