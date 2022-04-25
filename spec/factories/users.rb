FactoryBot.define do
  factory :user, aliases: %i[admin] do
    username { "user" }
    email { "keallar@gmail.com" }
    password { "qwerty$4" }
    admin { false }
  end
end
