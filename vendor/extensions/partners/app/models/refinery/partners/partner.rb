module Refinery
  module Partners
    class Partner < Refinery::Core::BaseModel
      self.table_name = 'refinery_partners'

      enum position: %i(sport_organization business_entity)


      translates :title, :description

      validates :title, :presence => true, :uniqueness => true
      validates :position, :presence => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:title]

    end
  end
end
