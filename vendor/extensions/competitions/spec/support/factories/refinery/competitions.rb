FactoryBot.define do
  factory :competition, :class => Refinery::Competitions::Competition do
    sequence(:title) {|n| "refinery#{n}"}
  end
end

