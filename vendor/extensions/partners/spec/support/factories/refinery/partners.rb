FactoryBot.define do
  factory :partner, :class => Refinery::Partners::Partner do
    sequence(:title) {|n| "refinery#{n}"}
  end
end

