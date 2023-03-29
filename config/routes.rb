Rails.application.routes.draw do
  resources :agents, only: [:index, :show] do
    resources :appointments, only: [:create]
  end
  get "/appointments/success", to: "appointments#show", as: "appointment_success"

  root "agents#index"
end
