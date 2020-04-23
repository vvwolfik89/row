FactoryBot.define do
  factory :athlete, :class => Refinery::Athletes::Athlete do
    sequence(:first_name) {|n| "refinery#{n}"}
  end
end

