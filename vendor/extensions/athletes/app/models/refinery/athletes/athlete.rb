module Refinery
  module Athletes
    class Athlete < Refinery::Core::BaseModel
      include FullName
      self.table_name = 'refinery_athletes'

      enum rowing_type: %w(academic_rowing kayaking_rowing canoe_rowing)
      enum gender: %w(male female)

      has_and_belongs_to_many :first_coach, class_name: 'Refinery::Coaches::Coach', join_table: 'athletes_first_coach', foreign_key: "refinery_athlete_id", association_foreign_key: :refinery_coach_id
      has_and_belongs_to_many :current_coach, class_name: 'Refinery::Coaches::Coach', join_table: 'athletes_current_coach', foreign_key: "refinery_athlete_id", association_foreign_key: :refinery_coach_id

      translates :first_name, :last_name, :patronymic, :territorial_unit, :educational_institution, :organisation, :first_organisation

      validates :first_name, :last_name, :patronymic, :presence => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      has_many :results, foreign_key: :athlete_id

      accepts_nested_attributes_for :results, allow_destroy: true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:first_name, :last_name, :patronymic]

      scope :with_filter, -> (options = {}) {
        with_rowing_type(options[:rowing_type]).
          with_gender(options[:gender]).
          search(options[:keyword]).
          active
      }

      scope :search, -> (keyword) {
        joins('JOIN refinery_athletes_translations ON refinery_athletes_translations.refinery_athlete_id = refinery_athletes.id').where('LOWER(refinery_athletes_translations.first_name) like :key OR refinery_athletes_translations.last_name like :key OR refinery_athletes_translations.patronymic like :key', key: "%#{keyword.downcase}%") if keyword.present?
      }

      scope :with_gender, -> (gender) {where(gender: gender) if gender.present?}
      scope :with_rowing_type, -> (rowing_type) {where(rowing_type: rowing_type) if rowing_type.present?}

      scope :active, -> {where(is_active: true)}
    end
  end
end
