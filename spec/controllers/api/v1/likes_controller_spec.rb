# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::LikesController, type: :controller do
  let(:like) { create :like }
  let(:user) { create :user }
  let(:product) { create :product }

  let(:valid_attributes) do
    {
      user_id: user.id,
      product_id: product.id
    }
  end

  let(:invalid_attributes) do
    { user_id: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: like.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Like' do
        expect do
          post :create, params: { like: valid_attributes }
        end.to change(Like, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: { like: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Like' do
        expect do
          post :create, params: { like: invalid_attributes }
        end.to change(Like, :count).by(0)
      end

      it 'returns a 422 status code' do
        post :create, params: { like: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:like_2) { create :like }
    it 'destroys the requested like' do
      expect do
        delete :destroy, params: { id: like_2.to_param }
      end.to change(Like, :count).by(-1)
    end
  end
end
