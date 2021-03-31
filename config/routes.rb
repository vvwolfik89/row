Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :data_emails
  mount Refinery::Core::Engine, at: Refinery::Core.mounted_path
end
