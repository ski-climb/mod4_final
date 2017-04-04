FactoryGirl.define do
  factory :link do
    url   "http://example.com"
    sequence(:title) { |n| "Best link evar #{n}" }
    read  false
    user
  end
end
