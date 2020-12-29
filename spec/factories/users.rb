FactoryBot.define do
  factory :user do
    nickname              {"はなくそ"}
    email                 {Faker::Internet.unique.free_email}
    password              {"123abc"}
    password_confirmation {password}
    last_name             {"ぜん角タロウ"}
    first_name            {"ぜん角タロウ"}
    last_name_kana        {"ゼンカクカナ"}
    first_name_kana       {"ゼンカクカナ"}
    birthday              {"1994-01-01"}
  end
end