module Refinery
  module Competitions
    module Admin
      class CompetitionsController < ::Refinery::AdminController
        helper ApplicationHelper
        helper CollectionHelper

        crudify :'refinery/competitions/competition'

        private

        # Only allow a trusted parameter "white list" through.
        def competition_params
          params.require(:competition).permit(:title, :description, :image_id, :type_of_competition, :location, :date_of_competition, :country, :city)
        end
      end
    end
  end
end
