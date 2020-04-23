module Refinery
  module Coaches
    class CoachesController < ::ApplicationController

      before_action :find_all_coaches
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @coach in the line below:
        present(@page)
      end

      def show
        @coach = Coach.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @coach in the line below:
        present(@page)
      end

      protected

      def find_all_coaches
        @coaches = Coach.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/coaches").first
      end

    end
  end
end
