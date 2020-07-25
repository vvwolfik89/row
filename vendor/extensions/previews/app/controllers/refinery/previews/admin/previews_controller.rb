module Refinery
  module Previews
    module Admin
      class PreviewsController < ::Refinery::AdminController

        crudify :'refinery/previews/preview'

        private

        # Only allow a trusted parameter "white list" through.
        def preview_params
          params.require(:preview).permit(:title, :icon_id, :description, :is_active)
        end
      end
    end
  end
end
