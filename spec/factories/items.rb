FactoryBot.define do

  factory :item do
    name              {"momotaro"}
    price             {1000}
    condition_id      {"1"}
    postage_id        {"1"}
    region_id         {"1"}
    shipping_date_id  {1}
    description       {"aaa"}
    seller_id         {1}
    status            {"exibiting"}
    category_id     {1}
    created_at        { Faker::Time.between(from: DateTime.now - 2, to: Datetime.now) }
  end

end