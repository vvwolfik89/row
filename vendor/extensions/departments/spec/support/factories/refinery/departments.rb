FactoryBot.define do
  factory :department, :class => Refinery::Departments::Department do
    sequence(:title) {|n| "refinery#{n}"}
  end
end

