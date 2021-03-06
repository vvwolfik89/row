module Refinery
  module Services
    class ServicesController < ::ApplicationController

      before_action :find_all_services
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @service in the line below:
        @services = Refinery::Services::Service.includes(:icon).with_filter(params).page(params[:page]).per_page(5)
        present(@page)
      end

      def show
        @service = Service.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @service in the line below:
        present(@page)
      end

      protected

      def find_all_services
        @services = Service.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/services").first
      end

    end
  end
end
