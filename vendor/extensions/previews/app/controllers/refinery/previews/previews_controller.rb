module Refinery
  module Previews
    class PreviewsController < ::ApplicationController

      before_action :find_all_previews
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @preview in the line below:
        present(@page)
      end

      def show
        @preview = Preview.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @preview in the line below:
        present(@page)
      end

      protected

      def find_all_previews
        @previews = Preview.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/previews").first
      end

    end
  end
end
