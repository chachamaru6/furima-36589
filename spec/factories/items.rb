FactoryBot.define do
  factory :item do
    name {"test"}
    explanation {"aaaaaaa"}
    status_id {2}
    category_id {2}
    schedule_id {2}
    prefecture_id {2}
    load_id {2}
    price {2000}
    

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/public/test_image.png'), filename: 'test_image.png')
    end



  end

end