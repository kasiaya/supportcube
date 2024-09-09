FactoryBot.define do
  factory :staff do
    employee_id           {'00000000'}
    department            {'診療部'}
    staff_name            {'鈴木'}
    staff_name_kana       {'スズキ'}
    email                 {Faker::Internet.email}
    password              {"#{Faker::Internet.password(min_length: 6)}1a"}
    password_confirmation {password}
  end
end