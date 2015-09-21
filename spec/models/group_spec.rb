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

require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'has a valid factory' do
    expect(build(:group)).to be_valid
  end

  context 'relationships' do
    subject { create(:group) }

    it { is_expected.to have_many(:group_members) }
    it { is_expected.to have_many(:users).through(:group_members) }
    it { is_expected.to have_many(:messages) }
  end

  context 'validations' do
    subject { create(:group) }

    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(50) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
