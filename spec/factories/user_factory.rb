FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "bob#{n}@example.com" }
    sequence(:username) {|n| "bob#{n}" }
    password "password"
    invite_code "dummy_code"
  end
end