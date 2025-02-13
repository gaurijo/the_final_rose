Rails.application.routes.draw do
  get '/bachelorettes/:id', to: 'bachelorettes#show'
  get "/bachelorettes/:bachelorette_id/contestants", to: 'contestants#index'
  get "/contestants/:id", to: 'contestants#show'
  get "/outtings/:id", to: 'outtings#show'
end
