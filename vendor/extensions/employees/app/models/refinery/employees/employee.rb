module Refinery
  module Employees
    class Employee < Refinery::Core::BaseModel
      include FullName
      self.table_name = 'refinery_employees'


      translates :first_name, :last_name, :patronymic, :education, :description, :position

      enum employee_type: %i(head deputy_head management_staff head_of_department employee)
      enum type_education: %i(secondary_education secondary_special_education higher_education)

      validates :first_name, :last_name, :patronymic, :presence => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      has_and_belongs_to_many :refinery_departments, class_name: '::Refinery::Departments::Department', join_table: 'refinery_departments_employees', foreign_key: "refinery_employee_id", association_foreign_key: 'refinery_department_id'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:first_name, :last_name, :patronymic]


      scope :with_filter, -> (options = {}) {
        with_type(options[:employee_type]).
          with_department(options[:refinery_departments]).
          search(options[:keyword]).
          active
      }

      scope :search, -> (keyword) {
        joins('JOIN refinery_employee_translations ON refinery_employee_translations.refinery_employee_id = refinery_employees.id').where('LOWER(refinery_employee_translations.first_name) ilike :key OR refinery_employee_translations.last_name ilike :key OR refinery_employee_translations.patronymic ilike :key', key: "%#{keyword.downcase}%") if keyword.present?
      }

      scope :active, -> {where(is_active: true)}

      scope :with_type, -> (type) {where(employee_type: type) if type.present?}

      scope :with_department, -> (department_id) {joins(:refinery_departments).where('refinery_departments.id = ?', department_id) if department_id.present?}

    end
  end
end
