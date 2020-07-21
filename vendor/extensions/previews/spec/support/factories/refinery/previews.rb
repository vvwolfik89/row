FactoryBot.define do
  factory :preview, :class => Refinery::Previews::Preview do
    sequence(:title) {|n| "refinery#{n}"}
  end
end

