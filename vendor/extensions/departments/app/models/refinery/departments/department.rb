module Refinery
  module Departments
    class Department < Refinery::Core::BaseModel
      self.table_name = 'refinery_departments'


      translates :title, :description

      has_and_belongs_to_many :refinery_employees, class_name: '::Refinery::Employees::Employee', join_table: 'refinery_departments_employees', foreign_key: "refinery_employee_id"

      validates :title, :presence => true, :uniqueness => true


      scope :active, -> {where(is_active: true)}

      # belongs_to :icon, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
