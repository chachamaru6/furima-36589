FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.free_email }
    password { 'aaa111' }
    password_confirmation { 'aaa111' }
    last_name { 'ハローテスト' }
    first_name { 'バーイテスト' }
    last_name_kana { 'ハローテスト' }
    first_name_kana { 'バーイテスト' }
    birthday { '2000-01-01' }
  end
end
