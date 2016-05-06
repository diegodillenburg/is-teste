FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:register_number) { |n| "#{n}"}
    status 0
  end
end
