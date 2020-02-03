# frozen_string_literal: true

module Api
  module V1
    # controller for Product
    class ProductsController < ActionController::API
      before_action :set_product, only: %i[show update destroy]

      def index
        @products = Product.all

        render json: @products
      end

      def show
        render json: @product
      end

      def create
        @product = Product.new(product_params)

        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @product.destroy
      end

      private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:title, :author, :release_date, :description, :section_id, :category)
      end
    end
  end
end
