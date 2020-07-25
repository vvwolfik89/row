module Refinery
  module Previews
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Previews

      engine_name :refinery_previews

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "previews"
          plugin.url = proc {Refinery::Core::Engine.routes.url_helpers.previews_admin_previews_path}
          plugin.pathname = root

        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Previews)
      end
    end
  end
end
