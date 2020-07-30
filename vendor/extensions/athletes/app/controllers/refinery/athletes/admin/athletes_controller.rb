module Refinery
  module Athletes
    module Admin
      class AthletesController < ::Refinery::AdminController
        helper ApplicationHelper
        helper CollectionHelper
        helper AthleteHelper

        crudify :'refinery/athletes/athlete',
                :title_attribute => 'last_name'

        private

        # Only allow a trusted parameter "white list" through.
        def athlete_params
          params.require(:athlete).permit(:first_name, :last_name, :patronymic, :bday, :rowing_type,
                                          :territorial_unit, :description, :is_active, :educational_institution,
                                          :organisation, :first_organisation, :icon_id, :gender, :url_instagram,
                                          {first_coach_ids: []}, {current_coach_ids: []},
                                          {
                                            results_attributes:
                                              [:id, :_destroy, :title, :located, :start_date, :description, :place, :locale]
                                          }
          )
        end
      end
    end
  end
end
