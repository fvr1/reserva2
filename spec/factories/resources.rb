# frozen_string_literals: true

FactoryBot.define do
  factory :resource do
    _attr1 { 'myValue' }
    sequence(:_attr2) do |n|
      "value#{n}"
    end
  end
end
