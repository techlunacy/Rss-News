require 'factory_girl'
require 'faker'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end

Factory.define :article do |a|
  a.title Faker::Lorem.sentence
  a.url Faker::Internet.url
  a.body Faker::Lorem.paragraphs
end

