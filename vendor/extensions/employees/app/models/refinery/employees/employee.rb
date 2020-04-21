module Refinery
  module Employees
    class Employee < Refinery::Core::BaseModel
      self.table_name = 'refinery_employees'


      translates :first_name, :last_name, :patronymic, :education, :description, :position

      enum employee_type: %i(head deputy_head management_staff head_of_department employee)
      enum type_education: %i(secondary_education secondary_special_education higher_education)

      validates :first_name, :presence => true, :uniqueness => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      has_and_belongs_to_many :refinery_departments, class_name: '::Refinery::Departments::Department', join_table: 'refinery_departments_employees', foreign_key: "refinery_employee_id", association_foreign_key: 'refinery_department_id'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
