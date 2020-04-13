module Refinery
  module Items
    module Admin
      class ItemsController < ::Refinery::AdminController

        crudify :'refinery/items/item'

        private

        # Only allow a trusted parameter "white list" through.
        def item_params
          params.require(:item).permit(:title, :date_start, :date_end, :photo_id, :content, :description)
        end
      end
    end
  end
end
