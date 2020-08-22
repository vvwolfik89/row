Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :competitions do
    resources :competitions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :competitions, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :competitions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
