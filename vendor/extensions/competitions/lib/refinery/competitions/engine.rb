module Refinery
  module Competitions
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Competitions

      engine_name :refinery_competitions

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "competitions"
          plugin.url = proc {Refinery::Core::Engine.routes.url_helpers.competitions_admin_competitions_path}
          plugin.pathname = root

        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Competitions)
      end
    end
  end
end
