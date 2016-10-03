FactoryGirl.define do
  factory :message do
    text 'Some text'

    trait :delete_after_hour do
      option 'hour'
    end

    trait :delete_after_visit do
      option 'visit'
    end
  end
end
