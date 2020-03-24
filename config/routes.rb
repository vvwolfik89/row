Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Refinery::Core::Engine, at: Refinery::Core.mounted_path
end
