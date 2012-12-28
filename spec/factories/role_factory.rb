FactoryGirl.define do


  factory :role_admin, class: ::Role do
    name "admin"
  end

  factory :role_usr, class: ::Role do
    name "usr"
  end

  factory :role_guest, class: ::Role do
    name "guest"
  end
end