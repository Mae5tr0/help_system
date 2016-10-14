module Api
  module V1
    class TicketsController < ApiController
      def index
        respond_with @tickets.preload(:user)
      end

      def show
        respond_with @ticket
      end

      def create
        @ticket.user = current_user
        unless @ticket.save
          fail BadRequestError.new(:invalid_params, @ticket.errors.full_messages.join(','))
        end

        head :no_content
      end

      def update
        @ticket.update(params.permit(:status))
        @ticket.save!

        head :no_content
      end

      def destroy
        @ticket.destroy

        head :no_content
      end

      def search
        # authorize! :index, Ticket

        @tickets = Ticket.search(params[:query]).preload(:user)
        respond_with @tickets
      end

      def ticket_params
        params.permit(:title, :content)
      end
    end
  end
end

