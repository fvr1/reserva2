class ReservationsController < ApplicationController
  def index
    @reservations = ReservationService.index
    render json: @reservations, status: 200
  end
  def show
    @reservation = ReservationService.show(params)
    @reservation ? render_json(@reservation, 200) : render_json({}, 404)
  end
  def create
    @reservation = ReservationService.create(params)
    @reservation ? render_json(@reservation, 200) : render_json({}, :unprocessable_entity)
  end
  def update
    @reservation = ReservationService.update(params)
    @reservation ? render_json(@reservation, 200) : render_json({}, :unprocessable_entity)
  end
  def destroy
    @reservation = ReservationService.destroy(params)
    @reservation == {} ? render_json({}, 200) : render_json({}, 500)
  end
  private
  def render_json(reservation, status)
    render json: reservation, status: status
  end
end
