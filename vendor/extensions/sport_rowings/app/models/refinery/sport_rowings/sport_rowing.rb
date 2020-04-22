module Refinery
  module SportRowings
    class SportRowing < Refinery::Core::BaseModel
      self.table_name = 'refinery_sport_rowings'

      enum kind: %i(academic_rowing kayaking_canoeing)

      AVAILABLE_COUNT_ATHLETES = [0, 1, 2, 4, 8]


      translates :title, :description

      validates :title, :presence => true, :uniqueness => true
      validate :uniq_short_name
      validate :uniq_count_athletes

      belongs_to :icon, :class_name => '::Refinery::Image'

      scope :active, -> {where(is_active: true)}

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:title]
      #

      protected

      def uniq_short_name
        id = self.id unless self.new_record?
        if self.class.where(kind: self.kind).where.not(id: id).exists?(short_name: self.short_name)
          errors.add(:short_name, ::I18n.t("short_name.errors.not_uniq"))
        end
      end

      def uniq_count_athletes
        count_athletes = self.count_athletes
        id = self.id unless self.new_record?
        if self.class.where(kind: self.kind).where.not(id: id).exists?(short_name: count_athletes) || !AVAILABLE_COUNT_ATHLETES.include?(count_athletes)
          errors.add(:count_athletes, ::I18n.t("count_athletes.errors.not_uniq"))
        end
      end
    end
  end
end
