FactoryGirl.define do
  factory :item do
    name "MyString"
    status "MyString"
    received_date "2017-11-13 01:20:15"
    workshop { Workshop.first || association(:workshop) }
  end
end
