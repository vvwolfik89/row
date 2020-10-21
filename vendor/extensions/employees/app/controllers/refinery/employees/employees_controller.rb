module Refinery
  module Employees
    class EmployeesController < ::ApplicationController

      # before_action :find_all_employees
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @employee in the line below:
        @employees = Employee.includes(:icon).order('position ASC').with_filter(params).page(params[:page]).per_page(5)
        present(@page)
      end

      def show
        @employee = Employee.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @employee in the line below:
        present(@page)
      end

      protected

      def find_all_employees
        @employees = Employee.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/employees").first
      end

    end
  end
end
