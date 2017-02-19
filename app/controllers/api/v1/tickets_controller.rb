module Api
  module V1
    class TicketsController < ApiController
      after_action :verify_policy_scoped, only: [:index, :search]

      def index
        @tickets = policy_scope(Ticket)
        render json: @tickets
      end

      def show
        authorize ticket

        render json: ticket
      end

      def create
        authorize Ticket

        Tickets::CreateTicketService.new(
          title: params[:title],
          content: params[:content],
          user: current_user
        ).perform

        head :no_content
      end

      def update
        authorize ticket

        Tickets::UpdateTicketService.new(
          title: params[:title],
          content: params[:content],
          status: params[:status],
          ticket: ticket
        ).perform

        head :no_content
      end

      def destroy
        authorize ticket

        ticket.destroy!

        head :no_content
      end

      def search
        skip_authorization

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
