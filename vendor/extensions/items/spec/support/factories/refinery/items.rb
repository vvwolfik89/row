FactoryBot.define do
  factory :item, :class => Refinery::Items::Item do
    sequence(:title) {|n| "refinery#{n}"}
  end
end

