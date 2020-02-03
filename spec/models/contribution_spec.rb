# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contribution, type: :model do
  describe '.initialize' do
    let(:contribution) { create :contribution }
    it { expect(contribution).to be_instance_of(Contribution) }
  end

  describe 'validations of presence' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:section) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:comment) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_inclusion_of(:status).in_array(Contribution::STATUSES) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'check_products errors' do
    let!(:product) { create(:product, title: 'Harry Potter', author: 'JK Rowling') }
    let(:contribution) { build(:contribution, title: 'Harry Potter', author: 'JK Rowling') }
    it 'raises an error if product with same title and author exists' do
      message = 'Harry Potter de JK Rowling existe déjà dans notre base de donnée'
      expect { contribution.save }.to raise_error(RuntimeError, message)
    end
  end
end
