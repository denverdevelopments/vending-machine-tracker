Rails.application.routes.draw do
  # root to: "owners#index"
  #
  # resources :owners do
  #   resources :machines, only: [:index]
  # end
  #
  resources :machines, only: [:show]


  get '/', to: 'machines#index'
  get '/machines', to: 'machines#index'
  get '/machines/:id', to: 'machines#show', as: :kevscrazyroad

  get '/snacks', to: 'snacks#index'
  get '/snacks/:id', to: 'snacks#show'
end
