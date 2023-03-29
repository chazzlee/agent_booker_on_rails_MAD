Rails.application.routes.draw do
  get "/agents", to: "agents#index"
  get "/agents/:id", to: "agents#show", as: "agent"

  post "/agents/:agent_id/appointments", to: "appointments#create", as: "agent_appointments"
  get "/appointments/success", to: "appointments#show", as: "appointment_success"
  root "agents#index"
end
