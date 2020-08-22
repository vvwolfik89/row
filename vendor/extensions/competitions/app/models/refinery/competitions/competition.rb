module Refinery
  module Competitions
    class Competition < Refinery::Core::BaseModel
      self.table_name = 'refinery_competitions'

      enum type_of_competition: %i(championship olympic)
      enum location: %i(local republic world)


      translates :title, :description, :country, :city

      validates :title, :presence => true

      belongs_to :image, :class_name => '::Refinery::Image'

      scope :with_location, -> (location) {where(location: location) if location.present?}
      scope :with_type_of_competition, -> (type_of_competition) {where(type_of_competition: type_of_competition) if type_of_competition.present?}

      scope :search, -> (keyword) {
        joins('JOIN refinery_competition_translations ON refinery_competition_translations.refinery_competition_id = refinery_competitions.id').where('LOWER(refinery_competition_translations.title) ilike :key', key: "%#{keyword.downcase}%") if keyword.present?
      }

      scope :with_filter, -> (options = {}) {
        with_location(options[:location]).
          with_type_of_competition(options[:type_of_competition]).
          search(options[:keyword])
      }


      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]
      #

    end
  end
end
