module Refinery
  module Athletes
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Athletes

      engine_name :refinery_athletes

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "athletes"
          plugin.url = proc {Refinery::Core::Engine.routes.url_helpers.athletes_admin_athletes_path}
          plugin.pathname = root

        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Athletes)
      end
    end
  end
end
