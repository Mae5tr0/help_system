module Api
  module V1
    class TicketsController < ApiController
      expose :tickets
      expose :ticket, find_by: :uid

      def index
        render json: tickets
      end

      def show
        render json: ticket
      end

      def create
        NewTicketService.new(params).perform
        # ticket.user = current_user
        # fail BadRequestError.new(:invalid_params, ticket.errors) unless ticket.save

        head :no_content
      end

      def update
        # UpdateTicketService.new(params).perform
        ticket.update(params.permit(:status))
        ticket.save!

        head :no_content
      end

      def destroy
        ticket.destroy

        head :no_content
      end

      def search
        # TODO why?
        skip_authorization

        @tickets = Ticket.search(params[:query])
        render json: @tickets
      end

      private

      def ticket_params
        params.permit(:title, :content)
      end
    end
  end
end

