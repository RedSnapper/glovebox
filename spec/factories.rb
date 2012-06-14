FactoryGirl.define do 
  sequence(:email) {|n| "person-#{n}@example.com" }

  factory :admin do
    email
    password               "password"
    password_confirmation  "password"
  end

  factory :upload do
    file { File.open(File.join(Rails.root, 'spec', 'support', 
                                 'uploads', 'file', 'rails.png')) }
  end
end

