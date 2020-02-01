# frozen_string_literal: true

module Api
  module V1
    # controller for Contribution
    class ContributionsController < ActionController::API
      before_action :set_contribution, only: %i[show update destroy]

      def index
        @contributions = Contribution.all

        render json: @contributions
      end

      def show
        render json: @contribution
      end

      def create
        @contribution = Contribution.new(contribution_params)

        if @contribution.save
          render json: @contribution, status: :created
        else
          render json: @contribution.errors, status: :unprocessable_entity
        end
      end

      def update
        if @contribution.update(contribution_params)
          render json: @contribution
        else
          render json: @contribution.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @contribution.destroy
      end

      private

      def set_contribution
        @contribution = Contribution.find(params[:id])
      end

      def contribution_params
        params.require(:contribution).permit(:title, :author, :comment, :section, :category, :status, :user_id)
      end
    end
  end
end
