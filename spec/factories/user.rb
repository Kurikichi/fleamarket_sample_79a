FactoryBot.define do

  factory :user do
    nickname                 {"テスト"}
    first_name               {"佐々木"}
    last_name                {"一郎"}
    kana_first_name          {"ササキ"}
    kana_last_name           {"イチロウ"}
    birthday                 {"1999-12-31"}
    email                    {"aaa@aaa.com"}
    password                 {"1234567"}
    # psssword_confirmation    {"1234567"}
  end

end