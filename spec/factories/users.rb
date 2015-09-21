# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  slug            :string           not null
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  avatar          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_slug   (slug) UNIQUE
#

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    # avatar 'MyString'
  end
end
