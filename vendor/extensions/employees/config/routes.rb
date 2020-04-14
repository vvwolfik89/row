Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :employees do
    resources :employees, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :employees, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :employees, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
