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

class User < ActiveRecord::Base
  extend FriendlyId

  ##
  # Behaviours
  has_secure_password
  friendly_id :username, use: :history

  ##
  # Relationships
  has_many :group_members
  has_many :groups, through: :group_members
  has_many :messages, as: :messageable

  ##
  # Validations
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, email: true, length: { maximum: 250 }, uniqueness: { case_sensitive: false }

  ##
  # Instance Methods
  def should_generate_new_friendly_id?
    username_changed?
  end
end
