# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  let(:section) { create :section }
  let(:valid_attributes) do
    {
      title: 'American Pie 3',
      author: 'Michal Dott',
      release_date: '2001-01-01',
      section_id: section.id,
      category: 'Fiction',
      description: 'This film which moved an entire generation'
    }
  end

  let(:invalid_attributes) do
    { title: nil }
  end
  let(:product) { create :product }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: product.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Product' do
        expect do
          post :create, params: { product: valid_attributes }
        end.to change(Product, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: { product: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Product' do
        expect do
          post :create, params: { product: invalid_attributes }
        end.to change(Product, :count).by(0)
      end

      it 'returns a 422 status code' do
        post :create, params: { product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          title: 'American Pie 4',
          release_date: '2002-01-01'
        }
      end

      it 'updates the requested product' do
        put :update, params: { id: product.to_param, product: new_attributes }
        product.reload
        expect(product.attributes).to include('title' => 'American Pie 4')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'returns a 422 status code' do
        put :update, params: { id: product.to_param, product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:product_2) { create :product }
    it 'destroys the requested product' do
      expect do
        delete :destroy, params: { id: product_2.to_param }
      end.to change(Product, :count).by(-1)
    end
  end
end
