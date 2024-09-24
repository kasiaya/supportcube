FactoryBot.define do
  factory :partner do
    institution_name           { 'テストクリニック' }
    institution_category_id    { Faker::Number.between(from: 2, to: 3) }
  end
end
