module Refinery
  module Athletes
    class Athlete < Refinery::Core::BaseModel
      self.table_name = 'refinery_athletes'


      translates :first_name, :last_name, :patronymic, :territorial_unit, :educational_institution, :organisation, :first_organisation

      validates :first_name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
