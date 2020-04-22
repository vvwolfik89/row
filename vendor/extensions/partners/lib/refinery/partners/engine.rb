module Refinery
  module Partners
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Partners

      engine_name :refinery_partners

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "partners"
          plugin.url = proc {Refinery::Core::Engine.routes.url_helpers.partners_admin_partners_path}
          plugin.pathname = root

        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Partners)
      end
    end
  end
end
