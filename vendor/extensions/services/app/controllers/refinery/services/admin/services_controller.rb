module Refinery
  module Services
    module Admin
      class ServicesController < ::Refinery::AdminController
        helper ApplicationHelper
        helper CollectionHelper

        crudify :'refinery/services/service'

        private

        # Only allow a trusted parameter "white list" through.
        def service_params
          params.require(:service).permit(:title, :kind, :icon_id, :description, :short_name, :coast, :show_inline, :is_active, :coast_value)
        end
      end
    end
  end
end
