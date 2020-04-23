Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :coaches do
    resources :coaches, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :coaches, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :coaches, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
