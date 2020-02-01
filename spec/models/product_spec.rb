# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '.initialize' do
    let(:product) { create :product }
    it { expect(product).to be_instance_of(Product) }
  end

  describe 'validations of presence' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:release_date) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to belong_to(:section) }
  end

  describe 'validations of uniqueness of title' do
    context 'in the scope of title' do
      let!(:product) { create :product }
      let(:product_2) { build :product }

      it 'raises an error' do
        message = 'Validation failed: Name has already been taken'
        expect { product_2 }.to raise_error(ActiveRecord::RecordInvalid, message)
      end
    end
  end
end
