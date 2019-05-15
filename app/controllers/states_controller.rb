class StatesController < ApplicationController
  def create
    @state = StateService.create(params)
    unless @state.nil?
      redirect_to done_reservation_path(id: @state.id)
    end
  end
end
