FactoryGirl.define do
  factory :user do
    email                 "a.kelly@example.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end