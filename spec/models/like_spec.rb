# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '.initialize' do
    let(:like) { create :like }
    it { expect(like).to be_instance_of(Like) }
  end

  describe 'validations of presence' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:product) }
  end
end
