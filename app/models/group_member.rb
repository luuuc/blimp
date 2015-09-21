# == Schema Information
#
# Table name: group_members
#
#  id         :uuid             not null, primary key
#  group_id   :uuid             not null
#  user_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_group_members_on_group_id_and_user_id  (group_id,user_id) UNIQUE
#

class GroupMember < ActiveRecord::Base
  ##
  # Relationships
  belongs_to :group
  belongs_to :user
end
