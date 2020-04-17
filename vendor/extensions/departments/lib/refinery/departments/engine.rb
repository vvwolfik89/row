module Refinery
  module Departments
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Departments

      engine_name :refinery_departments

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "departments"
          plugin.url = proc {Refinery::Core::Engine.routes.url_helpers.departments_admin_departments_path}
          plugin.pathname = root

        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Departments)
      end
    end
  end
end
