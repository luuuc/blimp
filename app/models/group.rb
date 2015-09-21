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

class Group < ActiveRecord::Base
  extend FriendlyId

  # Behaviours
  friendly_id :name, use: :history

  ##
  # Relationships
  has_many :group_members
  has_many :users, through: :group_members
  has_many :messages, as: :messageable

  ##
  # Validations
  validates :name, length: { minimum: 2, maximum: 50 }, uniqueness: { case_sensitive: false }

  ##
  # Instance Methods
  def should_generate_new_friendly_id?
    name_changed?
  end
end
