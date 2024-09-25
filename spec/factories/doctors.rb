FactoryBot.define do
  factory :doctor do
    doctor_name { '田中' }
    specialty_id { Faker::Number.between(from: 2, to: 5) }
  end
end
