module Refinery
  module SportRowings
    module Admin
      class SportRowingsController < ::Refinery::AdminController
        helper ApplicationHelper
        helper CollectionHelper

        crudify :'refinery/sport_rowings/sport_rowing'

        private

        # Only allow a trusted parameter "white list" through.
        def sport_rowing_params
          params.require(:sport_rowing).permit(:title, :kind, :icon_id, :description, :short_name, :count_athletes, :is_active)
        end
      end
    end
  end
end
