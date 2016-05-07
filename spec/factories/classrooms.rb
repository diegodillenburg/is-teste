FactoryGirl.define do
  factory :classroom do
    student_id 1
    course_id 1

    factory :invalid_classroom do
      student_id nil
    end
  end
end
