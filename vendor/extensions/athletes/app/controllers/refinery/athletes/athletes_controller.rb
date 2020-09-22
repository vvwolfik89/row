module Refinery
  module Athletes
    class AthletesController < ::ApplicationController

      before_action :find_all_athletes
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @athlete in the line below:
        @athletes = Refinery::Athletes::Athlete.with_filter(params).page(params[:page]).per_page(9)
        present(@page)
        respond_to do |format|
          format.html #index.html.erb
          format.json {render json: @athletes}
        end
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
