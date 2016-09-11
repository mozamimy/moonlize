Rails.application.routes.draw do
  root to: 'functions#index'
  resources :functions, only: %i(index)
end
