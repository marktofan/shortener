
FactoryGirl.define do

  factory :user do
    email "test@aaa.bb"
    password "aaaaaaa"
  end

  factory :admin_user, parent: :user do |_|
    after(:build) do |u|
      u.roles << FactoryGirl.create(:role_admin)
    end
  end

  factory :usr_user, parent: :user do |_|
    after(:build) do |u|
      u.roles << FactoryGirl.create(:role_usr)
    end
  end


  factory :guest_user, parent: :user do |_|
    after(:build) do |u|
      u.roles << FactoryGirl.create(:role_guest)
    end
  end


end