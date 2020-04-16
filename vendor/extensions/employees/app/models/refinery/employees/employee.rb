module Refinery
  module Employees
    class Employee < Refinery::Core::BaseModel
      self.table_name = 'refinery_employees'


      translates :first_name, :last_name, :patronymic, :education, :description, :position

      enum type_education: %i(head deputy_head management_staff head_of_department employee)
      enum employee_type: %i(secondary_education secondary_special_education higher_education)

      validates :first_name, :presence => true, :uniqueness => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
