FactoryBot.define do

  factory :admin, class: User do
    sequence(:email) { |n| "#{n}@ait.asia" } # Unique title for every account
    password {"password"}
    password_confirmation {"password"}
    association :role
  end
  factory :role, class: Role do
    name {"Admin"}
  end
  factory :typefood, class: Typefood do
    name {"Snack"}
  end
  factory :user, class: User do
    email {"st120577@ait.asia"}
    password {"password"}
    password_confirmation {"password"}
    association :role
  end

  factory :article , class: Revarticle do
    title "Taro"
    content "Taro content"
    rating 3
    price  10
    location "Lawson"
    association :user
    association :typefood
  end
end