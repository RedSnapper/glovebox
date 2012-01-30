Factory.sequence :email do |n|
  "test#{n}@example.com"
end

Factory.define :admin do |f|
  f.email                  { Factory.next(:email) }
  f.password               "password"
  f.password_confirmation  "password"
end

Factory.define :upload do |f|
  f.file { File.open(File.join(Rails.root, 'spec', 'support', 
                               'uploads', 'file', 'rails.png')) }
end
