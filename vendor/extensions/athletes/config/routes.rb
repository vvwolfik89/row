Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :athletes do
    resources :athletes, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :athletes, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :athletes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
