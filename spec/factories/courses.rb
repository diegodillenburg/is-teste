FactoryGirl.define do
  factory :course do
    name "MyString"
    description "MyString"
    status 1

    factory :invalid_course do
      name nil
    end
  end
end
