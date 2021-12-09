FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    # ランダムで生成する際、英数字になるよう'1a'追加
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    last_name { '蛯名' }
    first_name { '竜也' }
    last_name_kana { 'エビナ' }
    first_name_kana { 'タツヤ' }
    birthday { Faker::Date.birthday }
  end
end