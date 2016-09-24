module Api
  module V1
    class TicketsController < ResourceController
      def resource_class
        Ticket
      end

      def resource
        @ticket ||= Ticket.find_by_uid(params[:id])
      end

      def resource_params
        params.require(:ticket).permit(:title, :content, :status)
      end
    end
  end
end

