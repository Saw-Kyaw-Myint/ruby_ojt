FactoryBot.define do
  factory :user do
  email {|n| "user#{n}@example.com"}
  password {'dddddd'}
  end
end
