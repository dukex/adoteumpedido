
FactoryGirl.define do
  factory :authority do
    sequence(:url_name) {|n| "#{n}example" }
  end
end

