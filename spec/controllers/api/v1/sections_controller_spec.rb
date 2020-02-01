# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SectionsController, type: :controller do
  let(:section) { create :section }
  let(:user) { create :user }
  let(:valid_attributes) do
    {
      name: 'Movies',
      categories: %w[Comedy Indie],
      status: 'active'
    }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: section.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Section' do
        expect do
          post :create, params: { section: valid_attributes }
        end.to change(Section, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: { section: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Section' do
        expect do
          post :create, params: { section: invalid_attributes }
        end.to change(Section, :count).by(0)
      end

      it 'returns a 422 status code' do
        post :create, params: { section: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          categories: %w[Comedy Indie Drama]
        }
      end

      it 'updates the requested section' do
        put :update, params: { id: section.to_param, section: new_attributes }
        section.reload
        expect(section.attributes).to include('categories' => %w[Comedy Indie Drama])
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'returns a 422 status code' do
        put :update, params: { id: section.to_param, section: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:section_2) { create :section }
    it 'destroys the requested section' do
      expect do
        delete :destroy, params: { id: section_2.to_param }
      end.to change(Section, :count).by(-1)
    end
  end
end
