module Refinery
  module Services
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Services

      engine_name :refinery_services

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "services"
          plugin.url = proc {Refinery::Core::Engine.routes.url_helpers.services_admin_services_path}
          plugin.pathname = root

        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Services)
      end
    end
  end
end
