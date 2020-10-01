module Refinery
  module Items
    class ItemsController < ::ApplicationController

      before_action :find_all_items
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @item in the line below:
        @items = Item.order('created_at DESC').with_filter(params).page(params[:page]).per_page(5)
        present(@page)
      end

      def show
        @item = Item.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @item in the line below:
        present(@page)
      end

      protected

      def find_all_items
        @items = Item.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/items").first
      end

    end
  end
end
