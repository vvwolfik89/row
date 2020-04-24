module Refinery
  module Athletes
    module Admin
      class AthletesController < ::Refinery::AdminController
        helper ApplicationHelper
        helper CollectionHelper

        crudify :'refinery/athletes/athlete',
                :title_attribute => 'first_name'

        private

        # Only allow a trusted parameter "white list" through.
        def athlete_params
          params.require(:athlete).permit(:first_name, :last_name, :patronymic, :bday, :rowing_type, :territorial_unit, :educational_institution, :organisation, :first_organisation, :icon_id)
        end
      end
    end
  end
end
