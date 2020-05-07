module Refinery
  module Athletes
    class Athlete < Refinery::Core::BaseModel
      self.table_name = 'refinery_athletes'

      enum rowing_types: %i(academic_rowing kayaking_canoeing)


      translates :first_name, :last_name, :patronymic, :territorial_unit, :educational_institution, :organisation, :first_organisation

      validates :first_name, :presence => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      has_many :results, foreign_key: :athlete_id

      accepts_nested_attributes_for :results, allow_destroy: true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:first_name, :last_name, :patronymic]
    end
  end
end
