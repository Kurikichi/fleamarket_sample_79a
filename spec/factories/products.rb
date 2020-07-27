FactoryBot.define do

  factory :product do
    name                  {"tenchan"}
    price                 {1980}
    explanation           {"サンプルの説明文"}
    brand                 {"honda"}
    status                {1}
    shipping_charges      {1}
    shipping_origin       {1}
    days_until_shipping   {1}
    category_id           {1}
    user_id               {1}
    exhibition_status     {1}
  end

end