FactoryBot.define do
  factory :sport_rowing, :class => Refinery::SportRowings::SportRowing do
    sequence(:title) {|n| "refinery#{n}"}
  end
end

