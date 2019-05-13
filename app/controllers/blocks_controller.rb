class BlocksController < ApplicationController
  def index
    @blocks = BlockService.index
    render json: @blocks, status: 200
  end
  def show
    @block = BlockService.show(params)
    @block ? render_json(@block, 200) : render_json({}, 404)
  end
  def create
    @block = BlockService.create(params)
    @block ? render_json(@block, 200) : render_json({}, :unprocessable_entity)
  end
  def update
    @block = BlockService.update(params)
    @block ? render_json(@block, 200) : render_json({}, :unprocessable_entity)
  end
  def destroy
    @block = BlockService.destroy(params)
    @block == {} ? render_json({}, 200) : render_json({}, 500)
  end
  private
  def render_json(block, status)
    render json: block, status: status
  end
end
