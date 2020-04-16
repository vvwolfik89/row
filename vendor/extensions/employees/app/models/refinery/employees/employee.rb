module Refinery
  module Employees
    class Employee < Refinery::Core::BaseModel
      self.table_name = 'refinery_employees'

      enum employee_type: %i(нead deputy_head management_staff head_of_oepartment employee)
      enum type_education: %i(higher_education secondary_vocational secondary)


      validates :first_name, :presence => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
