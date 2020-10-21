module Refinery
  module Competitions
    class CompetitionsController < ::ApplicationController

      before_action :find_all_competitions
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @competition in the line below:
        @competitions = Competition.includes(:image).with_filter(params).page(params[:page]).per_page(5)
        present(@page)
      end

      def show
        @competition = Competition.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @competition in the line below:
        present(@page)
      end

      protected

      def find_all_competitions
        @competitions = Competition.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/competitions").first
      end

    end
  end
end
