module Refinery
  module Employees
    module Admin
      class EmployeesController < ::Refinery::AdminController

        crudify :'refinery/employees/employee',
                :title_attribute => 'first_name'

        private

        # Only allow a trusted parameter "white list" through.
        def employee_params
          params.require(:employee).permit(:first_name, :last_name, :patronymic, :employee_type, :type_education, :education, :phone, :bdate, :description, :position, :beginning_work_at, :icon_id, :is_active)
        end
      end
    end
  end
end
