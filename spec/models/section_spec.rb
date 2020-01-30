# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Section, type: :model do
  describe '.initialize' do
    let(:section) { create :section }
    it { expect(section).to be_instance_of(Section) }
  end

  describe 'validations of presence' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_inclusion_of(:status).in_array(Section::STATUSES) }
    it { is_expected.to have_many(:products) }
  end
end
