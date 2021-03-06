class ReservationsController < ApplicationController
  before_action :set_reservation

  def done; end

  private

  def set_reservation
    @reservation = Reservation.includes(state: [:resource, :block]).find_by(id: params[:id])
  end
end
