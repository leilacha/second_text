# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:user) { create :user }
  let(:product) { create :product }
  let(:comment) { create :comment }

  let(:valid_attributes) do
    {
      comment_text: 'American Pie is the best movie',
      user_id: user.id,
      product_id: product.id
    }
  end

  let(:invalid_attributes) do
    { comment_text: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: comment.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Comment' do
        expect do
          post :create, params: { comment: valid_attributes }
        end.to change(Comment, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: { comment: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Comment' do
        expect do
          post :create, params: { comment: invalid_attributes }
        end.to change(Comment, :count).by(0)
      end

      it 'returns a 422 status code' do
        post :create, params: { comment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:comment_2) { create :comment }
    it 'destroys the requested comment' do
      expect do
        delete :destroy, params: { id: comment_2.to_param }
      end.to change(Comment, :count).by(-1)
    end
  end
end
