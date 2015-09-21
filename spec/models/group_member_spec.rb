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

require 'rails_helper'

RSpec.describe GroupMember, type: :model do
  it 'has a valid factory' do
    expect(build(:group_member)).to be_valid
  end

  context 'relationships' do
    subject { create(:group_member) }

    it { is_expected.to belong_to(:group) }
    it { is_expected.to belong_to(:user) }
  end
end
