module Refinery
  module Coaches
    module Admin
      class CoachesController < ::Refinery::AdminController
        helper ApplicationHelper
        helper CollectionHelper

        crudify :'refinery/coaches/coach',
                :title_attribute => 'first_name'

        private

        # Only allow a trusted parameter "white list" through.
        def coach_params
          params.require(:coach).permit(:first_name, :last_name, :patronymic, :bday, :rowing_type, :icon_id, :description, :position, :type_of_staff, :is_active)
        end
      end
    end
  end
end
