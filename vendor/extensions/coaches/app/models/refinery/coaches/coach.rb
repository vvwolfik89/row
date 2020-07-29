module Refinery
  module Coaches
    class Coach < Refinery::Core::BaseModel
      include FullName
      self.table_name = 'refinery_coaches'

      enum rowing_type: %i(academic_rowing kayaking_canoeing)
      enum type_of_staff: %i(coach doctor masseur)


      translates :first_name, :last_name, :patronymic, :description, :position

      validates :first_name, :presence => true, :uniqueness => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:first_name, :last_name, :patronymic]

      scope :active, -> {where(is_active: true)}

    end
  end
end
