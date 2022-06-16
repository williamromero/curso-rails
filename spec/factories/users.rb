# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)
#  password_digest :text(65535)
#  token           :text(65535)
#  username        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    username { "MyString" }
    email { "MyString" }
    password { "MyText" }
    token { "MyText" }
  end
end
