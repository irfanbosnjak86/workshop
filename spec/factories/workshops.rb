FactoryGirl.define do
  factory :workshop do
    name "It Service"
    description "MyText"
    user { User.first || association(:user) }
  end
end
