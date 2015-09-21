# == Schema Information
#
# Table name: groups
#
#  id         :uuid             not null, primary key
#  slug       :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_slug  (slug) UNIQUE
#

FactoryGirl.define do
  factory :group do
    name { "#{Faker::Team.creature}-group" }
  end
end
