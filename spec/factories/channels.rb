# == Schema Information
#
# Table name: channels
#
#  id         :uuid             not null, primary key
#  slug       :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_channels_on_slug  (slug) UNIQUE
#

FactoryGirl.define do
  factory :channel do
    name { "#{Faker::Hacker.verb}-channel" }
  end
end
