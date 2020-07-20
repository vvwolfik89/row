module FullName
  extend ActiveSupport::Concern

  def full_name
    self.last_name.to_s + ' ' + self.first_name.to_s + ' ' + self.patronymic.to_s
  end
end
