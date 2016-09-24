module Api
  module V1
    class TicketsController < ApplicationController
      def index
        respond_with paginate(@tickets)
      end

      def show
        respond_with @ticket
      end

      def create
        head :no_content
      end

      def update
        head :no_content
      end
    end
  end
end

