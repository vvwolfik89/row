FactoryBot.define do
  factory :coach, :class => Refinery::Coaches::Coach do
    sequence(:first_name) {|n| "refinery#{n}"}
  end
end

