class ReportsController < ActionController::Base
  layout 'report'

  def tickets
    @tickets = Ticket.closed.where('created_at > ?', 1.month.ago).preload(:user)

    render :tickets
  end
end
