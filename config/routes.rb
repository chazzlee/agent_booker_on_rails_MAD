Rails.application.routes.draw do
  resources :agents, only: [:index, :show] do
    resources :appointments, only: [:create]
  end

  get "/appointments/success", to: "appointments#show", as: "appointment_success"

  # get "/agents", to: "agents#index"
  # get "/agents/:id", to: "agents#show", as: "agent"

  # post "/agents/:agent_id/appointments", to: "appointments#create", as: "agent_appointments"
  root "agents#index"
end
