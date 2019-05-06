FactoryBot.define do
  factory :reservation do
    mail { "MyString" }
    phone { "MyString" }
    name { "MyString" }
    comment { "MyText" }
    status { 1 }
  end
end
