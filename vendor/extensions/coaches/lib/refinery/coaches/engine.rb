module Refinery
  module Coaches
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Coaches

      engine_name :refinery_coaches

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "coaches"
          plugin.url = proc {Refinery::Core::Engine.routes.url_helpers.coaches_admin_coaches_path}
          plugin.pathname = root

        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Coaches)
      end
    end
  end
end
