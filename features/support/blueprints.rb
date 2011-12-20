require "machinist/active_record"

User.blueprint do
  email { "antgrape-#{sn}@example.com" }
  password { "mypass" }
  password_confirmation { "mypass" }
end