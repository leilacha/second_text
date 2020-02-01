# frozen_string_literal: true

module Api
  module V1
    # controller for Section
    class SectionsController < ActionController::API
      before_action :set_section, only: %i[show update destroy]

      def index
        @sections = Section.all

        render json: @sections
      end

      def show
        render json: @section
      end

      def create
        @section = Section.new(section_params)

        if @section.save
          render json: @section, status: :created
        else
          render json: @section.errors, status: :unprocessable_entity
        end
      end

      def update
        if @section.update(section_params)
          render json: @section
        else
          render json: @section.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @section.destroy
      end

      private

      def set_section
        @section = Section.find(params[:id])
      end

      def section_params
        params.require(:section).permit(:name, :status, categories: [])
      end
    end
  end
end
