module Refinery
  module Items
    class Item < Refinery::Core::BaseModel
      self.table_name = 'refinery_items'


      translates :title, :content, :description

      enum type_news: %i(birth_days world_news chanel_news)

      validates :title, :presence => true, :uniqueness => true

      belongs_to :icon, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:title]

      scope :with_filter, -> (options = {}) {
        with_type(options[:type_news]).
          search(options[:keyword]).
          order(:title)
      }

      scope :with_type, -> (type) {where(type_news: type) if type.present?}

      scope :search, -> (keyword) {
        where("lower(refinery_item_translations.title) like :key", key: "%#{keyword.downcase}%") if keyword.present?
      }

    end
  end
end
