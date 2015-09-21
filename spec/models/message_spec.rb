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

require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'has a valid factory' do
    expect(build(:message)).to be_valid
  end

  context 'relationships' do
    subject { create(:message) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:messageable) }
  end

  context 'validations' do
    subject { create(:message) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:messageable) }
  end
end
