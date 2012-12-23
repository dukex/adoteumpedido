# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    description "String"
    resume "String"
    authority
  end
end
