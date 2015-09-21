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

class Channel < ActiveRecord::Base
  extend FriendlyId

  # Behaviours
  friendly_id :name, use: :history

  ##
  # Relationships
  has_many :messages, as: :messageable

  ##
  # Validations
  validates :name, length: { minimum: 2, maximum: 50 }, uniqueness: { case_sensitive: false }

  ##
  # Instance Method
  def should_generate_new_friendly_id?
    name_changed?
  end
end
