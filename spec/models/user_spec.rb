# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.initialize' do
    let(:user) { create :user }
    it { expect(user).to be_instance_of(User) }
  end

  describe 'validations of presence' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:liked_products) }
  end
end
