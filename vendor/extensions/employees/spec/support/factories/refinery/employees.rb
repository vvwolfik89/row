FactoryBot.define do
  factory :employee, :class => Refinery::Employees::Employee do
    sequence(:first_name) {|n| "refinery#{n}"}
  end
end

