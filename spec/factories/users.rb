# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.name "John Doe"
  f.sequence(:email) {|n| "person#{n}@example.com" }
end
