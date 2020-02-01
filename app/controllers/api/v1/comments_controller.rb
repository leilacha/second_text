# frozen_string_literal: true

module Api
  module V1
    # controller for Comment
    class CommentsController < ActionController::API
      before_action :set_comment, only: %i[show destroy]

      def index
        @comments = Comment.all

        render json: @comments
      end

      def show
        render json: @comment
      end

      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @comment.destroy
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:comment_text, :user_id, :product_id)
      end
    end
  end
end
