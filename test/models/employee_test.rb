require 'test_helper'

module Refinery
  module Employees
    class EmployeeTest < ActiveSupport::TestCase
      should validate_presence_of(:first_name)
      should validate_presence_of(:last_name)
      should validate_presence_of(:patronymic)
    end
  end
end
