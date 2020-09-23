module Refinery
  module Services
    class Service < Refinery::Core::BaseModel
      self.table_name = 'refinery_services'

      enum kind: %i(transport center medical_center led_table)

      translates :title, :description, :coast

      validates :title, :presence => true, :uniqueness => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      scope :with_inline, -> {where(show_inline: true)}
      scope :active, -> {where(is_active: true)}

      scope :with_filter, -> (options = {}) {
        with_kind(options[:kind]).
          search(options[:keyword]).
          active
      }

      scope :search, -> (keyword) {
        joins('JOIN refinery_service_translations ON refinery_service_translations.refinery_service_id = refinery_services.id').where('LOWER(refinery_service_translations.title) like :key', key: "%#{keyword.downcase}%") if keyword.present?
      }

      scope :with_kind, -> (kind) {where(kind: kind) if kind.present?}


      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:title]

    end
  end
end
