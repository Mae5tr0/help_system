module Tickets
  class UpdateTicketService
    def initialize(params)
      @title = params[:title]
      @content = params[:content]
      @status = params[:status]
      @ticket = params[:ticket]
    end

    def perform
      @ticket.title = @title if @title
      @ticket.content = @content if @content
      @ticket.status = @status if @status
      @ticket.save!
    end
  end
end
