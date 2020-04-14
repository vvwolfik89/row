module Refinery
  module Employees
    module Admin
      class EmployeesController < ::Refinery::AdminController

        crudify :'refinery/employees/employee',
                :title_attribute => 'first_name'

        private

        # Only allow a trusted parameter "white list" through.
        def employee_params
          params.require(:employee).permit(:first_name, :last_name, :patronymic, :type, :type_education, :education, :phone, :bdate, :photo_id, :description, :position)
        end
      end
    end
  end
end
