module Refinery
  module Coaches
    class Coach < Refinery::Core::BaseModel
      include FullName
      self.table_name = 'refinery_coaches'

      enum rowing_type: %i(academic_rowing kayaking_rowing canoe_rowing)
      enum type_of_staff: %i(coach doctor masseur)


      translates :first_name, :last_name, :patronymic, :description, :position

      validates :first_name, :presence => true, :uniqueness => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:first_name, :last_name, :patronymic]

      scope :active, -> {where(is_active: true)}

      scope :with_filter, -> (options = {}) {
        with_rowing_type(options[:rowing_type]).
          with_type_of_staff(options[:type_of_staff]).
          # search(options[:keyword]).
          active
      }

      # scope :search, -> (keyword) {
      #   joins('JOIN refinery_athletes_translations ON refinery_athletes_translations.refinery_athlete_id = refinery_athletes.id').where('LOWER(refinery_athletes_translations.first_name) ilike :key OR refinery_athletes_translations.last_name ilike :key OR refinery_athletes_translations.patronymic ilike :key', key: "%#{keyword.downcase}%") if keyword.present?
      # }

      scope :with_type_of_staff, -> (type_of_staff) {where(type_of_staff: type_of_staff) if type_of_staff.present?}
      scope :with_rowing_type, -> (rowing_type) {where(rowing_type: rowing_type) if rowing_type.present?}

    end
  end
end
