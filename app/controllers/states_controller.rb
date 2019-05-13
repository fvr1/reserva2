class StatesController < ApplicationController
  def index
    @state = StateService.index
    render json: @state, status: 200
  end
  def show
    @state = StateService.show(params)
    @state ? render_json(@state, 200) : render_json({}, 404)
  end
  def create
    @state = StateService.create(params)
    @state ? render_json(@state, 200) : render_json({}, :unprocessable_entity)
  end
  def update
    @state = StateService.update(params)
    @state ? render_json(@state, 200) : render_json({}, :unprocessable_entity)
  end
  def destroy
    @state = StateService.destroy(params)
    @state == {} ? render_json({}, 200) : render_json({}, 500)
  end
  private
  def render_json(state, status)
    render json: state, status: status
  end
end
