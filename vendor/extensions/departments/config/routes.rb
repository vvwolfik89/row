Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :departments do
    resources :departments, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :departments, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :departments, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
