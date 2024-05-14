FactoryBot.define do
  factory :friend do
    first_name { "Friend" }
    last_name { "Last" }
    email { "example@example.com" }
    phone { "09345676897" }
    twitter { "twitter" }
    user
  end
end
