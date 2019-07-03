module ReservationService
  class << self

    def index
      @reservations = Reservation.all
      @reservations.map { |reservation| filter_params(reservation) }
    end
    def show(params)
      @reservation = set_reservation(params, true)
      if @reservation
        filter_params(@reservation)
      else
        nil
      end
    end
    def create(params)
      @reservation = Reservation.new(reservation_params(params))
      if @reservation.save
        filter_params(@reservation)
      else
        nil
      end
    end

    def update
      @reservation = set_resource(params, false)
      if @reservation and @reservation.update(resource_params(params))
        filter_params(@reservation)
      else
        nil
      end
    end

    def destroy
      @reservation = set_resource(params, false)
      if @reservation and @reservation.destroy
        {}
      else
        nil
      end
    end

  
    def set_reservation(params, filtered)
      if reservation.exists?(id: params[:id])
        @reservation = filtered ? filter_params(Reservation.find(params[:id])) : Reservation.find(params[:id])
      else
        @reservation = nil
      end
    end
    
    def filter_params(reservation)
      reservation.attributes.except("created_at", "updated_at")
    end

    def reservation_params(params)
      params.require(:reservation).permit(:mail, :phone, :name, :comment, :status, :state_id)
    end
  end
end