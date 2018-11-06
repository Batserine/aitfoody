FactoryBot.define do
  #---Admin----
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
      id 5
      email {"st120577@ait.asia"}
      password {"password"}
      password_confirmation {"password"}
      association :role, factory: :role_user
    end

    factory :article , class: Revarticle do
      id 7
      title "Taro"
      content "Taro content"
      rating 3
      price  10
      location "Lawson"
      association :user
      association :typefood
    end
    #---Reviewer----
    factory :reviewer, class: User do
        sequence(:email) { |n| "reviewer#{n}@ait.asia" } # Unique title for every account
        password {"password"}
        password_confirmation {"password"}
        association :role, factory: :role_reviewer
    end
    factory :reviewer2, class: User do
      id 2
      email {"reviewer@ait.asia" }
      password {"password"}
      password_confirmation {"password"}
      association :role, factory: :role_reviewer
    end

    factory :role_reviewer, class: Role do
      name {"Reviewer"}
    end
    factory :role_user, class: Role do
      name {"User"}
    end

    factory :article2 , class: Revarticle do
      sequence(:title) {|n| "food_title_#{n}" }
      sequence(:content) {|n| "food_content_#{n}" }
      rating 3
      price  10
      location "Lawson"
      approved {true}
      message  {"ok"}
      user_id 7
      # association :user, factory: :reviewer
      association :typefood
    end
    # factory :article3 , class: Revarticle do
    #   id 1
    #   title {"Taro2"}
    #   content {"Taro content2"}
    #   rating 3
    #   price  10
    #   location "Lawson"
    #   approved {true}
    #   message  {"ok"}
    #   user_id 7
    #   association :typefood
    # end

    # factory :version1 , class: Version do
    #   id 1
    #   item_type {"Revarticle"}
    #   event {"update"}
    #   whodunnit 7
    # end
  # factory :admin, class: User do
  #   sequence(:email) { |n| "#{n}@ait.asia" } # Unique title for every account
  #   password {"password"}
  #   password_confirmation {"password"}
  #   # association :role
  #   association :role, factory: :role_admin
  # end

  # factory :user, class: User do
  #   sequence(:email) {|n| "user#{n}@example.com" }
  #   email "user@example.com"
  #   password {"password"}
  #   password_confirmation {"password"}
  #   association :role, factory: :role_reviewer
  # end
  # factory :user, class: User do
  #   # email {"st120577@ait.asia"}
  #   id 5
  #   email {"st120577@ait.asia"}
  #   password {"password"}
  #   password_confirmation {"password"}
  #   association :role, factory: :role_user
  # end

  # factory :reviewer, class: User do
  #   sequence(:email) { |n| "reviewer#{n}@ait.asia" } # Unique title for every account
  #   password {"password"}
  #   password_confirmation {"password"}
  #   association :role, factory: :role_reviewer
  # end
  #
  # factory :role, class: Role do
  #   name {"Admin"}
  # end
  #
  # factory :role_admin, class: Role do
  #   name {"Admin"}
  # end
  #
  # factory :role_user, class: Role do
  #   name {"User"}
  # end
  #
  # factory :role_reviewer, class: Role do
  #   name {"Reviewer"}
  # end
  # # factory :role, class: Role do
  # #   name {"Admin"}
  # # end
  # factory :typefood, class: Typefood do
  #   name {"Snack"}
  # end
  #
  # factory :article , class: Revarticle do
  #   # title "Taro"
  #   # content "Taro content"
  #   sequence(:title) {|n| "food_title_#{n}" }
  #   sequence(:content) {|n| "food_content_#{n}" }
  #   rating 3
  #   price  10
  #   location "Lawson"
  #   user_id 2
  #   # association :user
  #   association :typefood
  # end

end