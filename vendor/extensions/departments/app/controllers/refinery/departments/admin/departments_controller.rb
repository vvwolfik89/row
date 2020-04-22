module Refinery
  module Departments
    module Admin
      class DepartmentsController < ::Refinery::AdminController
        helper ApplicationHelper
        helper CollectionHelper

        crudify :'refinery/departments/department'

        private

        # Only allow a trusted parameter "white list" through.
        def department_params
          params.require(:department).permit(:title, :icon_id, :description, :is_active)
        end
      end
    end
  end
end
