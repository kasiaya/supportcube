FactoryBot.define do
  factory :referral do
    patient_name  {'鈴木一朗'}
    age  {1}
    gender  {1}
    adl  {"全介助"}
    history  {1}
    purpose  {1}
    insurance  {1}
    prognosis  {"自宅"}
    status  {0}
    determination  {"preparing"}
    memo  {"最短希望"}

    association :staff
    association :doctor
    association :partner
  end
end
