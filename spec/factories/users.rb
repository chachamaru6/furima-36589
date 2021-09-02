FactoryBot.define do
      factory :user do
        nickname {"test"}
        email {"test@gmail.com"}
        password {Faker::Internet.password(min_length: 6)}
        password_confirmation {password}
        last_name {"ハローテスト"}
        first_name {"バーイテスト"}
        last_name_kana {"ハローテスト"}
        first_name_kana {"バーイテスト"}
        birthday {"2000-01-01"}
      end
end


