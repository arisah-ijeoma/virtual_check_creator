FactoryBot.define do
  factory :virtual_cheque do
    recipient_name { Faker::Name.name }
    date { Faker::Date.between(2.days.ago, Date.today) }
    amount { Faker::Number.decimal(4, 2) }
  end
end
