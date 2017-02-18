module Api
  module V1
    class TicketsController < ApiController
      def index
        @tickets = policy_scope(Ticket)
        render json: tickets
      end

      def show
        authorize ticket
        render ticket
      end

      def create
        Tickets::CreateTicketService.new({}).perform

        # ticket.user = current_user
        # TODO validation errors
        # fail BadRequestError.new(:invalid_params, ticket.errors) unless ticket.save

        head :no_content
      end

      def update
        # TODO: improve change status
        authorize ticket
        # ticket.send()
        # ticket.update(params.permit(:status))
        # ticket.save!

        Tickets::UpdateTicketService.new({}).perform

        head :no_content
      end

      def destroy
        authorize ticket
        ticket.destroy!

        head :no_content
      end

      def search
        @tickets = policy_scope(Ticket).search(params[:query])
        render json: @tickets
      end

      private

      def ticket
        @ticket ||= Ticket.find_by!(uid: params[:id])
      end
    end
  end
end
