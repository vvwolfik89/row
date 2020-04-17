module Refinery
  module Items
    module Admin
      class ItemsController < ::Refinery::AdminController

        crudify :'refinery/items/item'

        private

        # Only allow a trusted parameter "white list" through.
        def item_params
          params.require(:item).permit(:title, :date_start, :date_end, :icon_id, :content, :description, :position, :type_news)
        end
      end
    end
  end
end
