Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :sport_rowings do
    resources :sport_rowings, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :sport_rowings, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :sport_rowings, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
