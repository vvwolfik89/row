module Refinery
  module Employees
    class Employee < Refinery::Core::BaseModel
      self.table_name = 'refinery_employees'

      enum type: %i(oldest_sort latest_sort random_sort)
      # enum type_education: %i(oldest_sort latest_sort random_sort)
      # enum position: %i(oldest_sort latest_sort random_sort)


      validates :first_name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
