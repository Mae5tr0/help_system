module Tickets
  class CreateTicketService
    def initialize(params)
      @title = params[:title]
      @content = params[:content]
      @user = params[:user]
    end

    def perform
      Ticket.create!(title: @title, content: @content, user: @user)
    end
  end
end
