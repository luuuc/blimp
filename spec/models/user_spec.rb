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

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context 'behaviours' do
    subject { build(:user) }

    it { is_expected.to have_secure_password }
  end

  context 'relationships' do
    subject { create(:user) }

    it { is_expected.to have_many(:group_members) }
    it { is_expected.to have_many(:groups).through(:group_members) }
    it { is_expected.to have_many(:messages) }
  end

  context 'validations' do
    subject { create(:user) }

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_most(50) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(250) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
