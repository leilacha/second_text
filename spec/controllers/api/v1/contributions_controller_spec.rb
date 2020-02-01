# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ContributionsController, type: :controller do
  let(:user) { create :user }
  let(:contribution) { create :contribution }
  let(:valid_attributes) do
    {
      title: 'American Pie',
      author: 'Michal Dott',
      section: 'Movies',
      category: 'Fiction',
      comment: 'This is my favorite movie ever',
      status: 'approved',
      user_id: user.id
    }
  end

  let(:invalid_attributes) do
    { title: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: contribution.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Contribution' do
        expect do
          post :create, params: { contribution: valid_attributes }
        end.to change(Contribution, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: { contribution: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Contribution' do
        expect do
          post :create, params: { contribution: invalid_attributes }
        end.to change(Contribution, :count).by(0)
      end

      it 'returns a 422 status code' do
        post :create, params: { contribution: invalid_attributes }
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

      it 'updates the requested contribution' do
        put :update, params: { id: contribution.to_param, contribution: new_attributes }
        contribution.reload
        expect(contribution.attributes).to include('title' => 'American Pie 4')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'returns a 422 status code' do
        put :update, params: { id: contribution.to_param, contribution: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:contribution_2) { create :contribution }
    it 'destroys the requested contribution' do
      expect do
        delete :destroy, params: { id: contribution_2.to_param }
      end.to change(Contribution, :count).by(-1)
    end
  end
end
