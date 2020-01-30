# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '.initialize' do
    let(:comment) { create :comment }
    it { expect(comment).to be_instance_of(Comment) }
  end

  describe 'validations of presence' do
    it { is_expected.to validate_presence_of(:comment_text) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:product) }
  end
end
