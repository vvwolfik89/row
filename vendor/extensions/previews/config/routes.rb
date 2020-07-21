Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :previews do
    resources :previews, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :previews, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :previews, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
