FactoryBot.define do
  factory :item do
      name                   {"スニーカー"}
      description            {"NIKEの新作のスニーカーです"}
      category_id            {"レディース"}
      condition_id           {"新品、未使用"}
      shipping_id            {1}
      area_id                {1}
      preparation_id         {1}
      price                  {"500"}
      user_id                {1}
      # item_images {[
        # FactoryBot.build(:item_image, item: nil)
      # ]}
      association :user
  end
end