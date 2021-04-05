class DataEmail < ApplicationRecord
  enum type_of_email: %i(individual entity)
  validates :email, :text, :address, :name, presence: true
  validates :unp, presence: true, if: -> (b) {b.entity?}
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
end
