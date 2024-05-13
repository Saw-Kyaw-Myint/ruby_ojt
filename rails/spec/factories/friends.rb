FactoryBot.define do
  factory :friend do
    first_name { |n| "Friend#{n}" }
    last_name { |n| "Last#{n}" }
    email { |n| "friend#{n}@example.com" }
    phone { |n| "123456789#{n}" }
    twitter { |n| "twitter#{n}" }
    user
  end
end
