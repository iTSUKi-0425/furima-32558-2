FactoryBot.define do
  factory :history do
      token {"tok_abcdefghijk00000000000000000"}
      postal_code            {"123-4567"}
      area_id                {1}
      city                   {"横浜市緑区"}
      house_number           {"青山1-1-1"}
      building_name          {""}
      phone_number           {"09012345678"}
  end
end

