Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/states', to: 'collections#states'
  get '/states/:id', to: 'collections#macroregions'
  get '/macroregion/:id', to: 'collections#microregions'
  get '/microregion/:id', to: 'collections#stations'
  get '/equipments', to: 'collections#equipments'
  post '/collection', to: 'collections#create'
  get '/collections', to: 'collections#index'

end
