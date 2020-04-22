module Refinery
  module Partners
    module Admin
      class PartnersController < ::Refinery::AdminController
        helper ApplicationHelper
        helper CollectionHelper

        crudify :'refinery/partners/partner'

        private

        # Only allow a trusted parameter "white list" through.
        def partner_params
          params.require(:partner).permit(:title, :icon_id, :description, :is_active, :url_address, :position)
        end
      end
    end
  end
end
