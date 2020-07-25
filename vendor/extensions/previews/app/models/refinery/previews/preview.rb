module Refinery
  module Previews
    class Preview < Refinery::Core::BaseModel
      self.table_name = 'refinery_previews'


      translates :title, :description

      validates :title, :presence => true, :uniqueness => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]
      #
      scope :active, -> {where(is_active: true)}

    end
  end
end
