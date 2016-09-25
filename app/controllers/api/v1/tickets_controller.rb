module Api
  module V1
    class TicketsController < ApiController
      def index
        respond_with @tickets
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

      def destroy
        @ticket.destroy

        head :no_content
      end
    end
  end
end

