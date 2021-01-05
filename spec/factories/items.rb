FactoryBot.define do
  factory :item do
      name                   {"スニーカー"}
      description            {"NIKEの新作のスニーカーです"}
      category_id            {1}
      condition_id           {1}
      shipping_id            {1}
      area_id                {1}
      preparation_id         {1}
      price                  {500}
      
      after(:build) do |item|
        item.image.attach(io: File.open('downloads/test_omuraice.png'), filename: 'test_omuraice.png')
      end
      association :user
  end
end