FactoryBot.define do
  factory :user do
    nickname           {'nick'}
    email              {Faker::Internet.free_email}
    password           {'test1122'}
    password_confirmation {'test1122'}
    family_name        {'漢字'}
    first_name         {'ひらがな'}
    family_name_kana   {'カタカナ'}
    first_name_kana    {'カタカナ'}
    birthday           {'2011-01-11'}
  end
end