class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    logger.debug "==[current_user]==: #{current_user.inspect}"
    @list = Reservation.get_list(current_user.id)
    logger.debug "==[list]==: #{@list.inspect}"
  end

  def register
  end

  def cancel
  end

  def delete
  end
end
