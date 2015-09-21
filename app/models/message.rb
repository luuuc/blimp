# == Schema Information
#
# Table name: messages
#
#  id               :uuid             not null, primary key
#  messageable_type :string(50)       not null
#  messageable_id   :uuid             not null
#  user_id          :uuid             not null
#  type             :string(50)       not null
#  body             :string
#  data             :hstore
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_messages_on_type_and_messageable_type_and_messageable_id  (type,messageable_type,messageable_id)
#  index_messages_on_user_id                                       (user_id)
#

class Message < ActiveRecord::Base
  ##
  # Attributes
  store_accessor :data

  ##
  # Relationships
  belongs_to :user
  belongs_to :messageable, polymorphic: true

  ##
  # Validations
  validates :user, presence: true
  validates :messageable, presence: true
end
