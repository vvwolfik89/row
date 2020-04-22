module Refinery
  module SportRowings
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::SportRowings

      engine_name :refinery_sport_rowings

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "sport_rowings"
          plugin.url = proc {Refinery::Core::Engine.routes.url_helpers.sport_rowings_admin_sport_rowings_path}
          plugin.pathname = root

        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::SportRowings)
      end
    end
  end
end
