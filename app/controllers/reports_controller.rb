class ReportsController < ApplicationController
  layout 'report'

  def tickets
    @tickets = Ticket.where('created_at > ?', 1.month.ago).preload(:user)
    render :tickets
  end
end
