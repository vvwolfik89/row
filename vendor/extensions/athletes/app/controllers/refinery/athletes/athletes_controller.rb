module Refinery
  module Athletes
    class AthletesController < ::ApplicationController

      before_action :find_all_athletes
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @athlete in the line below:
        present(@page)
      end

      def show
        @athlete = Athlete.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @athlete in the line below:
        present(@page)
      end

      protected

      def find_all_athletes
        @athletes = Athlete.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/athletes").first
      end

    end
  end
end
