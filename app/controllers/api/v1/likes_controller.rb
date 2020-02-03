# frozen_string_literal: true

module Api
  module V1
    # controller for Like
    class LikesController < ActionController::API
      before_action :set_like, only: %i[show destroy]

      def index
        @likes = Like.all

        render json: @likes
      end

      def show
        render json: @like
      end

      def create
        @like = Like.new(like_params)

        if @like.save
          render json: @like, status: :created
        else
          render json: @like.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @like.destroy
      end

      private

      def set_like
        @like = Like.find(params[:id])
      end

      def like_params
        params.require(:like).permit(:user_id, :product_id)
      end
    end
  end
end
