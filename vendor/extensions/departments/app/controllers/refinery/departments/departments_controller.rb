module Refinery
  module Departments
    class DepartmentsController < ::ApplicationController

      before_action :find_all_departments
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @department in the line below:
        present(@page)
      end

      def show
        @department = Department.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @department in the line below:
        present(@page)
      end

      protected

      def find_all_departments
        @departments = Department.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/departments").first
      end

    end
  end
end
