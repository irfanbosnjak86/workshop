FactoryGirl.define do
  factory :user do
    email "test@workshop.com"
    password "password"
    password_confirmation "password"
  end
end