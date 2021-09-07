FactoryBot.define do
  factory :order_address do

    post_number     {"123-4567"}
    prefecture_id   {2}
    city            {"愛知県"}
    address_num     {"1-1"}
    building_name   {"東京スカイツリー"}
    telephone       {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
